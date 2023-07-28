/// $ node xor_encrypt.js mytestkey "A quick brown fox jumps over the lazy dog."

function xor_encrypt(raw_string /*: Uint8Array*/, key /*: Uint8Array*/) {
	var result = [];
	for (var i = 0; i < raw_string.length; i++)
		result.push(raw_string[i] ^ key[i % key.length]);

	return new Uint8Array(result);
}

if (process.argv.length < 4) {
	console.error(`Usage: node xor_encrypt.js key content`);
	process.exit(1);
}

console.log("original\t:", process.argv[3]);

var raw_string = new TextEncoder().encode(process.argv[3]);
var key = new TextEncoder().encode(process.argv[2]);

var encrypted_string = xor_encrypt(raw_string, key);
var decrypted_string = xor_encrypt(encrypted_string, key);

//console.log("encrypted\t:", encrypted_string);
console.log("decrypted\t:", new TextDecoder().decode(decrypted_string));

