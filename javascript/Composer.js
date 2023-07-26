/// A OOP-styled `compose` function for explaining how `koa-compose` works.
/// 	<https://github.com/koajs/compose/blob/master/index.js>

class Composer {
	constructor(middlewares) {
		this.middlewares = middlewares;
		this.next = () => 0;
		this.context = {};
		this.index = -1;
	}

	dispatch(i) {
		if (i <= this.index) { return Promise.reject("next() called multiple times"); }

		this.index = i;
		let fn = this.middlewares[i];
		if (i == this.middlewares.length) { fn = this.next; }
		if (!fn) { return Promise.resolve(); }

		try {
			return Promise.resolve(
				fn(this.context, () => this.dispatch(i + 1))
			);
		} catch (err) {
			return Promise.reject(err);
		}
	}

	compose() {
		return async (context, next) => {
			this.context = context;
			this.next = next;
			this.dispatch(0);
		};
	}

} // class Composer


async function test() {
	const composer = new Composer([
		async (_, next) => {
			console.log("middleware 1, start");
			await next();
			await next();
			console.log("middleware 1, end");
		},
		async (_, next) => {
			console.log("middleware 2, start");
			await next();
			console.log("middleware 2, end");
		},
		async (_, next) => {
			console.log("middleware 3, start");
			await next();
			console.log("middleware 3, end");
		},
	]);
	const fn = composer.compose();
	await fn({}, () => console.log("final"));
}

test().catch(console.error);

