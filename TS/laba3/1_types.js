"use strict";
const isFetching = true;
const isLoading = false;
const int = 42;
const float = 4.2;
const num = 3e10;
const message = 'Hello Typescript';
const numberArray = [1, 1, 2, 3, 5, 8, 13];
const numberArray2 = [1, 1, 2, 3, 5, 8, 13];
const words = ['Hello', 'Typescript'];
// Tuple
const contact = ['Vladilen', 1234567];
console.log(contact[1]);
// Any
let variable = 42;
// ...
variable = 'New String';
variable = [];
// ====
function sayMyName(name) {
    console.log(name);
}
sayMyName('Хайзенберг');
// Never
function throwError(message) {
    throw new Error(message);
}
function infinite() {
    while (true) {
    }
}
function func(a) {
    let arr = [];
    arr.push(a);
    arr.push(a);
    arr.push(a);
    return arr;
}
console.log(func(2));
const login = 'admin';
const id1 = 1234;
const id2 = '1234';
