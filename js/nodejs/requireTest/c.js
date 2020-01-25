var b = require("./b");

// module `a` wass `require` by b, so it's cached.
// the following `require` will NOT happen.
var a = require("./a");

console.log(a);
