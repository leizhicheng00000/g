// 本地复刻 dsh 启动时的 patch 应用过程，只为验证语法与最终结构。
// 用 rootfs 里同一份 js-yaml（0.2.2-rc.1 依赖的版本），schema 与
// cordis-plugin-include 里一致：yaml.JSON_SCHEMA.extend(JsExpr)。
const fs = require('fs');
const path = require('path');
const yaml = require(path.resolve(__dirname, 'extract/js-yaml'));

// !!js 表达式类型：dsh 用 cordis 的 JsExpr，这里只要不抛错、原样留标记即可
const JsExpr = new yaml.Type('tag:yaml.org,2002:js', {
  kind: 'scalar',
  construct: (d) => ({ __js: String(d) }),
});
const schema = yaml.JSON_SCHEMA.extend(JsExpr);

function load(file) {
  const text = fs.readFileSync(file, 'utf8');
  const doc = yaml.load(text, { schema, filename: file });
  if (!Array.isArray(doc)) throw new Error(file + ' 顶层不是数组');
  return doc;
}

// dsh applyPatches 的核心：把 insert 里的行纳入 id 索引，再按 id 浅赋值覆盖
function applyPatches(data, patches) {
  data = JSON.parse(JSON.stringify(data));
  const map = new Map();
  const walk = (list) => {
    for (const e of list) {
      if (e.id) map.set(e.id, e);
      if (e.group && Array.isArray(e.config)) walk(e.config);
    }
  };
  walk(data);
  for (const p of patches) {
    const { id, insert, name, ...over } = p;
    if (insert) {
      if (id) {
        const t = map.get(id);
        if (!t || !t.group) continue;
        (t.config = t.config || []).push(...insert);
      } else data.push(...insert);
      walk(insert);
      continue;
    }
    const t = map.get(id);
    if (!t) { console.log('  [warn] patch 目标不存在:', id); continue; }
    if (name && name !== t.name) { console.log('  [warn] name 不匹配:', id); continue; }
    for (const [k, v] of Object.entries(over)) { if (k !== 'id') t[k] = v; }
  }
  return data;
}

const std = load('extract/dsh-web-app/presets/standard.patch.yml');
const app = load('pojia.preview.yml');
// 真实顺序：base 配置（这里用空树近似，standard 的 insert 会自己长出那一行）
// → bundle patch 层 → --patch overlay。我们这层最后应用，所以能命中 insert 出来的行。
const composed = applyPatches([], std.concat(app));

const preset = composed.find((e) => e.id === 'preset-standard');
if (!preset) throw new Error('最终树里找不到 preset-standard');
const cfg = preset.config;
const persona = cfg.plugins.find((p) => p.id === 'persona');
const text = fs.readFileSync('persona_system.md', 'utf8').trim();

console.log('preset-standard:  id=%s order=%s plugins=%d', cfg.id, cfg.order, cfg.plugins.length);
console.log('persona.complete =', persona.config.complete);
console.log('persona.includeRuntimeContext =', persona.config.includeRuntimeContext);
console.log('persona.prefix 字符数 =', persona.config.prefix.length, '(源文件', text.length, ')');
console.log('正文 == 源文件 :', persona.config.prefix.trim() === text);
console.log('agent-instructions 保留 :', cfg.plugins.some((p) => p.id === 'agent-instructions'));
console.log('tool 数量 :', cfg.plugins.filter((p) => String(p.name || '').includes('dsh-tool-')).length);
console.log('!!js 表达式存活 :', cfg.plugins.filter((p) => p.disabled && p.disabled.__js).length, '项');
console.log('---- 正文首行 ----');
console.log(persona.config.prefix.split('\n')[0]);
console.log('---- 正文末行 ----');
console.log(persona.config.prefix.split('\n').slice(-1)[0]);
