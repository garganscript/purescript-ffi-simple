'use strict';

function getProperty(prop, obj) { return obj[prop]; };

exports._typeof = function typeOf(v) { return typeof v; };
exports._instanceof = function instanceOf(v, o) { return v instanceof o; };
exports._getProperty = getProperty;
exports._setProperty = function setProperty(prop, obj, value) {
  obj[prop] = value;
  return obj;
};
exports._defineProperty = function defineProperty(prop, obj, value) {
  Object.defineProperty(obj, prop, {value: value, writable: false});
  return obj;
};
