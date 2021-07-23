## The list operation syntax

> In languages like Erlang, Haskell and Lisp, `list` is something like linked-list, it's not the `list` in Python (which is something like pointer-array). But that's all about the implementation, In the syntax level, we don't consider those things.

We will compare `List` in Erlang with the `Array` in Javascript (syntax only)

### Creating List (or Array)

In Erlang, it's `[A | B]`.  (In Haskell, it's `a : b`, in Elm, it's `a :: b`, etc.)

```erlang
[6 | [1, 2, 3, 4, 5]].
%> [6,1,2,3,4,5]
```

In Javascript, it's `[A, ...B]`:

```javascript
[6, ...[1, 2, 3, 4, 5]]
//> [ 6, 1, 2, 3, 4, 5 ]
```

Matching List (or Array) is very similar.

In Erlang, it's `[A | B] = Data`:

```erlang
[A | B] =       [1, 2, 3, 4, 5, 6].
%> [1,2,3,4,5,6]

A.
%> 1

B.
%> [2,3,4,5,6]
```

In Javascript, it's `[A, ...B]`:

```javascript
[A, ...B] =     [1, 2, 3, 4, 5, 6];
//> [ 1, 2, 3, 4, 5, 6 ]

A;
//> 1

B;
//> [ 2, 3, 4, 5, 6 ]
```
