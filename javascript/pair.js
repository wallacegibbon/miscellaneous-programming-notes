export let pair = (a, b) => access => access(a, b);

export let head = p => p((a, _) => a);

export let tail = p => p((_, b) => b);

export let is_pair = x => typeof x === "function";

export let length = ls => ls === null ? 0 : 1 + length(tail(ls));

export let to_string = x => is_pair(x) ? `(${to_string(head(x))}, ${to_string(tail(x))})` : String(x);

/// Usage examples:

to_string(pair(1, pair(2, pair(3, null))));
//> "(1, (2, (3, null)))"

to_string(pair(1, pair(pair(pair(1, 5), 3), null)));
//> "(1, (((1, 5), 3), null))"

to_string(tail(pair(1, pair(pair(pair(1, 5), 3), null))));
//> "(((1, 5), 3), null)"

length(pair(1, pair(pair(pair(1, 5), 3), null)));
//> 2

