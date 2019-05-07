'use strict';

exports._global = function(name) {
  if (typeof window === 'undefined')
    return console.log("FFI.Simple.Globals.global: window is undefined");
  return window[name];
 };
