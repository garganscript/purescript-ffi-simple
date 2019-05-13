'use strict';

const glob
  =  (typeof globalThis !== 'undefined' && globalThis)
  || (typeof window !== 'undefined' && window)
  || (typeof global !== 'undefined' && global)
  || false;

exports._global
  = glob
  ? (function(name) { return glob[name]; })
  : (function() {
       console.warn("FFI.Simple.Globals.global: none of globalThis, window, global are defined, falling back to silently returning undef");
       return function() {};
  })();


