'use strict';

const glob
  =  (typeof globalThis !== 'undefined' && globalThis)
  || (typeof window !== 'undefined' && window)
  || (typeof global !== 'undefined' && global)
  || false;

export function _global(name) {
    if(glob) {
	return glob[name];
    } else {
	console.warn("FFI.Simple.Globals.global: none of globalThis, window, global are defined, falling back to silently returning undef");
	return function() {};
    }
}

