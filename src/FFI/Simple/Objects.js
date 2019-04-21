'use strict';
exports._typeof = function typeOf(v) { return typeof v; };
exports._getProperty = function getProperty(prop, obj) { return obj[prop]; };
exports._setProperty = function setProperty(prop, obj, value) {
  obj[prop] = value;
  return obj;
};
exports._defineProperty = function defineProperty(prop, obj, value) {
  Object.defineProperty(obj, prop, {value: value, writable: false});
  return obj;
};

