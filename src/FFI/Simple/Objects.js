'use strict';

export function _typeof(v) { return typeof v; }
export function _instanceof(obj, thing) { return obj instanceof thing; }
export function _isIn(prop, obj) { return prop in obj; }
export function _keys(obj) { return Object.keys(obj); }
export function _hasOwnProperty(prop, obj) { return obj.hasOwnProperty(prop); }
export function _getProperty(prop, obj) { return obj[prop]; }
export function _setProperty(prop, obj, value) {
    obj[prop] = value;
    return obj;
}
export function _defineProperty(prop, obj, value) {    
  Object.defineProperty(obj, prop, {value: value, writable: false});
  return obj;
}
export function _removeProperty(prop, obj) {
    delete obj[prop];
    return obj;
}
