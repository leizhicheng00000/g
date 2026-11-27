// 用 dsh 同款 js-yaml 校验 iOS / 鸿蒙 preset 的最终语义。
// 与 verify_patch.js 的区别：那边验的是 --patch overlay 叠加结果，
// 这边验的是直接改本体的 preset（两平台没有启动参数通道）。
const fs = require('fs');
const path = require('path');
let yaml;
try {
  yaml = require('js-yaml');   // npm i js-yaml
} catch (e) {
  throw new Error('需要 js-yaml：npm i js-yaml');
}

const JsExpr = new yaml.Type('tag:yaml.org,2002:js', {
  kind: 'scalar',
  construct: (d) => ({ __js: String(d) }),
});
const schema = yaml.JSON_SCHEMA.extend(JsExpr);

const target = process.argv[2];
if (!target) throw new Error('用法: node verify_cross.js <preset.yml>');
const doc = yaml.load(fs.readFileSync(target, 'utf8'), { schema, filename: target });
if (!Array.isArray(doc)) throw new Error('顶层不是数组');

// standard.patch.yml 顶层是 `- insert: [...]`，preset-standard 在 insert 里
let root = doc.find((e) => e && e.id === 'preset-standard');
if (!root) {
  for (const p of doc) {
    if (Array.isArray(p.insert)) {
      root = p.insert.find((x) => x && x.id === 'preset-standard');
      if (root) break;
    }
  }
}
if (!root) throw new Error('找不到 preset-standard');
const cfg = root.config;
const plugins = cfg.plugins;
const persona = plugins.find((p) => p.id === 'persona');
if (!persona) throw new Error('找不到 persona');

const src = fs.readFileSync(path.resolve(__dirname, '..', 'persona_system.md'), 'utf8');

console.log('preset-standard : id=%s order=%s plugins=%d', cfg.id, cfg.order, plugins.length);
console.log('persona.complete = %s', persona.config.complete);
console.log('persona.includeRuntimeContext = %s', persona.config.includeRuntimeContext);
console.log('prefix 字符数 = %d (源文件 %d)', persona.config.prefix.length, src.trim().length);
console.log('正文逐字一致 : %s', persona.config.prefix.trim() === src.trim());
console.log('agent-instructions 保留 : %s', plugins.some((p) => p.id === 'agent-instructions'));
console.log('tool 行数 : %d', plugins.filter((p) => /dsh-tool-/.test(String(p.name || ''))).length);
console.log('!!js 表达式存活 : %d 项', plugins.filter((p) => p.disabled && p.disabled.__js).length);
console.log('group 行 : %d 项', plugins.filter((p) => p.group).length);
console.log('---- 正文首行 ----');
console.log(persona.config.prefix.split('\n')[0]);
console.log('---- 正文末行 ----');
console.log(persona.config.prefix.split('\n').filter(Boolean).slice(-1)[0]);

const checks = {
  'complete 为 true': persona.config.complete === true,
  '正文与源文件一致': persona.config.prefix.trim() === src.trim(),
  'plugins 22 项': plugins.length === 22,
  'agent-instructions 在': plugins.some((p) => p.id === 'agent-instructions'),
  'js 表达式 3 项': plugins.filter((p) => p.disabled && p.disabled.__js).length === 3,
  '含回执口令': persona.config.prefix.includes('破甲自检'),
  '含群号': persona.config.prefix.includes('1108636855'),
};
let bad = 0;
for (const [k, v] of Object.entries(checks)) {
  console.log('%s %s', v ? '  OK  ' : ' FAIL ', k);
  if (!v) bad++;
}
process.exit(bad ? 1 : 0);
