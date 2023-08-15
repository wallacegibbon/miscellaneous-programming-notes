type Person = {name: string, marriage: boolean};

type PersonWrapper = {[A in keyof Person as `get_${A}`]: () => Person[A]};
///> type PersonWrapper = {get_name: () => string, get_marriage: () => boolean}

type Person0 = {[A in keyof Person as never]: Person[A]};
///> type Person0 = {}

type Person1 = {[A in keyof Person]: Person[A]};
///> type Person1 = {name: string, marriage: boolean};

type PersonConditionWrapper = {[A in keyof Person as Person[A] extends string ? never : `get_${A}`]: () => Person[A]};
///> type PersonConditionWrapper = {get_marriage: () => boolean};


type ABC = "a" | "b" | "c";
type BCD = "b" | "c" | "d";
type DEF = "d" | "e" | "f";

type ABC_BCD = ABC & BCD
///> type ABC_BCD = "b" | "c"

type ABC_DEF = ABC & DEF
///> type ABC_DEF = never

type BCD_DEF = BCD & DEF
///> type BCD_DEF = "d"

