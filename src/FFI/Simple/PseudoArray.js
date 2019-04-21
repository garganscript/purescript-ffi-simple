'use strict';
exports._from = function(a) { return Array.from(a); };
exports._drop = function(i,a) { return Array.prototype.slice.call(a, i); };
exports._slice = function(i,j,a) { return Array.prototype.slice.call(a, i, j); };
