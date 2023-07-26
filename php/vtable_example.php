<?php

/// The way to use PHP in the same style that I write C and Javascript code.

$person_vtable = array(
	"say_hi" => "person_say_hi",
);

function person_new($name, $age) {
	global $person_vtable;
	return array(
		"vtbl"	=> &$person_vtable,
		"name"	=> $name,
		"age"	=> $age,
	);
}

function person_info(&$self) {
	return "~ " . $self["name"] . " " . $self["age"] . " ~";
}

function person_say_hi(&$self) {
	echo "hello, I'm " . $self["name"] . ".";
}

$blah = person_new("Wallace Gibbon", 100);

echo person_info($blah);

echo "<br/>";

$blah["vtbl"]["say_hi"]($blah);

?>

