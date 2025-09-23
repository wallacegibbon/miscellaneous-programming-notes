type Person = {name: string, marriage: boolean, [blah: number]: string};

type Person0 = {[A in keyof Person as `get${Capitalize<A & string>}`]: () => Person[A]};
///> type Person0 = {getName: () => string, getMarriage: () => boolean}

type Person1 = {[A in keyof Person as never]: Person[A]};
///> type Person1 = {}

type Person2 = {[A in keyof Person as A extends string ? A : never]: Person[A]};
///> type Person2 = {name: string, marriage: boolean};

type Person3 = {[A in keyof Person as Person[A] extends string ? never : `get${Capitalize<A & string>}`]: () => Person[A]};
///> type Person3 = {getMarriage: () => boolean};


type ABC = "a" | "b" | "c";
type BCD = "b" | "c" | "d";
type DEF = "d" | "e" | "f";

type ABC_BCD = ABC & BCD
///> type ABC_BCD = "b" | "c"

type ABC_DEF = ABC & DEF
///> type ABC_DEF = never

type BCD_DEF = BCD & DEF
///> type BCD_DEF = "d"

