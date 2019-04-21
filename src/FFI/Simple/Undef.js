'use strict';
exports._undefined = undefined;
exports._nullUndef = function nullUndef(v) { return (typeof v === 'undefined') ? null : v; };
