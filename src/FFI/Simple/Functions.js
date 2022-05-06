'use strict';

function args() { return arguments; }

export function _args1() { return arguments; }
export function _args2() { return arguments; }
export function _args3() { return arguments; }
export function _args4() { return arguments; }
export function _args5() { return arguments; }
export function _args6() { return arguments; }
export function _args7() { return arguments; }
export function _args8() { return arguments; }
export function _args9() { return arguments; }
export function _args10() { return arguments; }
export function _bind(f, obj) { return f.bind(obj); };
export function _apply(f, that, args) { return f.apply(that, args); };
export function _new(obj, args) {
  const args2 = args.slice();
  args2.unshift(obj);
  // We could obj.bind.apply(obj, args) but obj may have overwritten `.bind`
  return new (Function.prototype.bind.apply(obj, args2));
}
