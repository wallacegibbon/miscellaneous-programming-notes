//////////////////////////////////////////////////////////////////////////////
/// "exports" is just a reference to "module.exports",
/// requrie() will return "module.exports"
/// in a module, if you do "exports.blah = something;",
/// module.exports will be
/// affected.
/// but if you write "exports = someojb", module.exports will stay what it was.
/// so you need to write as "module.exports = someojb".


//////////////////////////////////////////////////////////////////////////////
/// __filename : absolute path of the script file
/// __dirname  : absolute path of that contains the script file
///
/// It does NOT matter which directory you run the script
///
/// e.g. (in file `/tmp/a.js`)
///
/// __filename is "/tmp/a.js"
/// __dirname  is "/tmp"


//////////////////////////////////////////////////////////////////////////////
/// get command line arguments
process.argv;


//////////////////////////////////////////////////////////////////////////////
/// A handy function: util.inspect
/// Sometimes, JSON.stringify will go wrong (invalid JSON). But util.inspect
/// always work
util.inspect(someojb);


//////////////////////////////////////////////////////////////////////////////
/// Buffer with ``
new Buffer([ 97, 98, 99 ]);
//> <Buffer 61 62 63>

`${new Buffer([ 97, 98, 99 ])}`;
//> 'abc'
