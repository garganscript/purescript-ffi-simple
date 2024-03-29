'use strict';

export function val() { return this.val; };
export function sum() {    
  return Array.prototype.reduce.call(arguments, function(a,b) { return a + b; }, 0);
}
export function summer() {
  return Array.prototype.reduce.call(arguments, function(a,b) { return a + b; }, this.val);    
}
export let _object = Object;
export let _string = String;
