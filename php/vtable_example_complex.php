<?php

/// The way to use PHP in the same style that I write C and Javascript code.

class PersonVirtualTable {
	// public callable $say_hi; /// not supported
	public $say_hi;
}

class Person {
	public PersonVirtualTable $vtbl;
	public string $name;
	public int $age;
}

$person_vtable = new PersonVirtualTable();
$person_vtable->say_hi = "person_say_hi";

function person_new(string $name, int $age): Person {
	global $person_vtable;
	$r = new Person();
	$r->vtbl = &$person_vtable;
	$r->name = $name;
	$r->age = $age;
	return $r;
}

function person_info(Person &$self): string {
	return "~ $self->name, $self->age ~";
}

function person_say_hi(Person &$self): void {
	echo "hello, I'm $self->name";
}

$blah = person_new("Wallace Gibbon", 100);

echo person_info($blah);

echo "<br/>";

/// $blah->say_hi($blah); // invalid, will try to search for method `say_hi`.
($blah->vtbl->say_hi)($blah);

?>
