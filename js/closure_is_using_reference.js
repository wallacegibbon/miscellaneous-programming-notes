var counter = 1;

/// Every closure holds references to captured variables. (not copies of captured variables)
/// Even if there is no the concepts of `reference` in Javascript language level.

setInterval(function () { counter++; }, 2000);
setInterval(function () { console.log(">>>", counter); }, 1000);

