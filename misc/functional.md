F# style
```
let w =
    opt {
        let! a = x
        let! b = y
        let! c = z
        return a + b + c
    }
```

Haskell style
```
let w =
    x >>= fun a ->
        y >>= fun b ->
            z >>= fun c ->
                Some(a + b + c)
```

C# style
```
var x =
    x.flatMap(a =>
        y.flatMap(b =>
            z.flatMap(c =>
                new Class(a + b + c)
            )
        )
    )
```

