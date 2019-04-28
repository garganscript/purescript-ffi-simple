'use strict';

exports._undef = undefined;
exports._isUndef = function isUndefined(v) { return (typeof v === 'undefined'); };
exports._nullUndef = function nullUndef(v) { return (typeof v === 'undefined') ? null : v; };
