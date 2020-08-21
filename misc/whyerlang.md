** Use recursion to do everything

Recursion can easily do whatever loop can do.
Loop can not easily do what recursion can do.


** No address concept

In many languages, when comparing two objects, you need to know a concept called
"address", two objects with the same shape and same values are not equal if
their addresses is not the same.

```javascript
[1,2,3] === [1,2,3]  //> false
```

```python
[1,2,3] is [1,2,3]  #> False
[1,2,3] == [1,2,3]  #> True
```

But in Erlang, this concept is totally removed. two objects with the same shape
and same value are equal.


** Pattern matching

Pattern matching in Erlang is probably the most powerful one among all
languages. (maybe Prolog is more powerful in this field)

Pattern matching in Erlang has made the language more powerful and simpler.

