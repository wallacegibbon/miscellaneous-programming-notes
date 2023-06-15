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

$Person_vtable = new PersonVirtualTable();
$Person_vtable->say_hi = "Person_say_hi";

function Person_new(string $name, int $age): Person {
	global $Person_vtable;
	$r = new Person();
	$r->vtbl = $Person_vtable;
	$r->name = $name;
	$r->age = $age;
	return $r;
}

function Person_info(Person &$self): string {
	return "~ $self->name, $self->age ~";
}

function Person_say_hi(Person &$self): void {
	echo "hello, I'm $self->name";
}

$blah = Person_new("Wallace Gibbon", 100);

echo Person_info($blah);

echo "<br/>";

/// $blah->say_hi($blah); // invalid, will try to search for method `say_hi`.
($blah->vtbl->say_hi)($blah);

?>
