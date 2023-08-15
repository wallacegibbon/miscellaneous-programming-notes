/// <https://stackoverflow.com/a/4947829>
/// Theoretically, a nested function in JavaScript has access to all variables in all containing scopes.
/// When an identifier is encountered, it is resolved against the scope chain, which is a list
/// that includes objects whose properties are variables and function parameters of each containing
/// execution context (i.e. enclosing function), innermost first, plus the global object at the end.
/// A function object drags its scope chain around with it wherever it goes.

var shared_number = 1;

setInterval(function () { shared_number++; }, 2000);
setInterval(function () { console.log(">>> shared_number:", shared_number); }, 1000);


var shared_object = { x: 1, y: 2 };

function blah1() {
	shared_object = { x: 10, y: 20 };
}

function blah2() {
	shared_object = { x: 100, y: 200 };
}

setTimeout(blah1, 2000);
setTimeout(blah2, 4000);
setInterval(function () { console.log(">>> shared_object", shared_object); }, 1000);

