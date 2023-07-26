/// The way to import a javascript file dynamicly

/// create a script dom, and set the javascript src
var s = document.createElement("script");
s.src = "/js/ajax.js";

/// append the script object to the dom tree
document.querySelector("head").appendChild(s);
/// the target do NOT have to be "head"
document.querySelector("body").appendChild(s);

