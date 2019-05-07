'use strict';

exports._global
  = (typeof window === 'undefined')
    ? (function() {
       console.warn("FFI.Simple.Globals.global: window is undefined");
       return function() {};
       })()
  : (function(name) { return window[name]; });

