/// in nodejs, you need "npm install xmldom", and then:
var { DOMParser } = require('@xmldom/xmldom');

/// browsers support DOMParser by default.

var parser = new DOMParser();
var dom = parser.parseFromString("<x><y id=\"a\" /></x>", "text/xml");

dom.getElementsByTagName("x")[0].childNodes[0].getAttribute("id"); //> "a"

