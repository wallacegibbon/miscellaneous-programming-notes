export let pair = (a, b) => access => access(a, b);

export let head = p => p((a, _) => a);

export let tail = p => p((_, b) => b);

export let is_pair = x => typeof x === "function";

export let length = ls => ls === null ? 0 : 1 + length(tail(ls));

export let to_string = x => is_pair(x) ? `(${to_string(head(x))}, ${to_string(tail(x))})` : String(x);

