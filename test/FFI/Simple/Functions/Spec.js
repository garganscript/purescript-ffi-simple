'use strict';
function sum() {
  return Array.prototype.reduce.call(arguments, function(a,b) { return a + b; }, 0);
}
function summer() {
  return Array.prototype.reduce.call(arguments, function(a,b) { return a + b; }, this.val);
}
exports.val = function() { return this.val; };
exports.sum = sum;
exports.summer = summer;
exports._object = Object;
exports._string = String;
