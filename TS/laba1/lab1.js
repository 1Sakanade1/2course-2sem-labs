"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Challenge = void 0;
//z1
function CreatePhoneNumber(nums) {
    if (nums.length != 10) {
        console.log("неверная длинна массива");
    }
    else {
        console.log(`(${nums.slice(0, 3).join('')}) ${nums.slice(3, 6).join('')}-${nums.slice(6).join('')}`);
    }
}
CreatePhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]);
console.log("-----------");
//z2
class Challenge {
    static solution(number) {
        let result = 0;
        for (let i = 0; i < number; i++) {
            if (i % 3 == 0 || i % 5 == 0) {
                result += i;
            }
        }
        console.log(result);
    }
}
exports.Challenge = Challenge;
Challenge.solution(10);
console.log("-----------");
//z3
function sdvig(nums, k) {
    return nums.slice(nums.length - k, nums.length).concat(nums.slice(0, nums.length - k)); //12345678 
}
console.log(sdvig([1, 2, 3, 4, 5, 6, 7], 3));
console.log("-----------");
//z4
function mediana(mas1, mas2) {
    mas1 = mas1.concat(mas2);
    mas1.sort();
    console.log(mas1);
    if (mas1.length % 2 != 0) {
        return mas1[mas1.length / 2 - 0.5];
    }
    return (mas1[mas1.length / 2] / 2 + mas1[mas1.length / 2 - 1] / 2);
}
console.log(mediana([1, 4, 7, 8], [2, 3, 6, 7]));
//z5
function sudokucheck(sudokufield) {
    let set1 = new Set();
    //linecheck
    for (let i = 0; i < 9; i++) {
        for (let j = 0; j < 9; j++) {
            if (set1.has(sudokufield[i][j]) && sudokufield[i][j] != 0) {
                console.log("ошибка в линиях");
                return false;
            }
            if (sudokufield[i][j] > 9) {
                console.log("слишком большое число");
                return false;
            }
            set1.add(sudokufield[i][j]);
        }
        set1.clear();
    }
    set1.clear();
    //columncheck
    for (let i = 0; i < 9; i++) {
        set1.clear;
        console.log(set1);
        for (let j = 0; j < 9; j++) {
            console.log(sudokufield[j][i] + " ");
            if (set1.has(sudokufield[j][i]) && sudokufield[j][i] != 0) {
                console.log("ошибка в колонках");
                return false;
            }
            if (sudokufield[j][i] > 9) {
                console.log("слишком большое число");
                return false;
            }
            set1.add(sudokufield[j][i]);
        }
        set1.clear();
    }
    let cols = 0;
    let rows = 0;
    set1.clear();
    //3x3 check
    for (let y = 0; y < 3; y++) {
        for (let i = 0; i < 3; i++) {
            for (let j = rows; j < rows + 3; j++) {
                for (let k = cols; k < cols + 3; k++) {
                    if (set1.has(sudokufield[j][k]) && sudokufield[j][k] != 0) {
                        console.log("ошибка в 3х3");
                        return false;
                    }
                    if (sudokufield[j][k] > 9) {
                        console.log("слишком большое число");
                        return false;
                    }
                    set1.add(sudokufield[j][k]);
                }
            }
            set1.clear();
            cols += 3;
        }
        cols = 0;
        rows += 3;
    }
    console.log("успех");
    return true;
}
let sudokufield = [
    [1, 2, 3, 4, 5, 6, 7, 8, 9],
    [0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 9]
];
sudokucheck(sudokufield);
