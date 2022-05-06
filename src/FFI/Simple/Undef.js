'use strict';

export const _undef = undefined;
export function _isUndef(v) { return (typeof v === 'undefined'); };
export function _nullUndef(v) { return (typeof v === 'undefined') ? null : v; };
