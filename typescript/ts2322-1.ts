//type F = <T extends {[k: string]: any}>(o: T) => T;
type F = <T extends {a: number, [x: string]: any}>(o: T) => T;

let f: F = (o) => {
	/// The type inferred for r (the returning of `Object.fromEntries`) is {[k: string]: any}, not `typeof o`;

	//let r = Object.fromEntries(Object.entries(o));

	let r = Object.fromEntries(Object.entries(o)) as typeof o;

	return r;
};

