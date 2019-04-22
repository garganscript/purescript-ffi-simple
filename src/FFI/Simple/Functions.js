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
exports._delay = function delay(a, f) {
  return function() { return f()(a); };
};
