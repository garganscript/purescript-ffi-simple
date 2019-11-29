'use strict';

function args() { return arguments; }

exports._args1 = args;
exports._args2 = args;
exports._args3 = args;
exports._args4 = args;
exports._args5 = args;
exports._args6 = args;
exports._args7 = args;
exports._args8 = args;
exports._args9 = args;
exports._args10 = args;
exports._bind = function bind(f, obj) { return f.bind(obj); };
exports._apply = function apply(f, that, args) { return f.apply(that, args); };
exports._new = function newer(obj, args) {
  const args2 = args.slice();
  args2.unshift(obj);
  // We could obj.bind.apply(obj, args) but obj may have overwritten `.bind`
  return new (Function.prototype.bind.apply(obj, args2));
}
