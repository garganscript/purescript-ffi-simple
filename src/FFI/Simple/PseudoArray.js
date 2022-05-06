'use strict';

export function _from(a) { return Array.from(a); };
export function _drop(i,a) { return Array.prototype.slice.call(a, i); };
export function _slice(i,j,a) { return Array.prototype.slice.call(a, i, j); };
export function _unshift(i,a) { a.unshift(i); return a; };
