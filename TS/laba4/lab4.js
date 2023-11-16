"use strict";
//z1
const array = [
    { id: 1, name: "Vasya", group: 10 },
    { id: 2, name: "Ivan", group: 11 },
    { id: 3, name: "Misha", group: 12 },
    { id: 4, name: "Petya", group: 10 },
    { id: 5, name: "Kira", group: 11 }
];
let car = {};
car.manufacturer = "manufacturer";
car.model = "model";
//z3
const car1 = {};
car1.manufacturer = "manufacturer";
car1.model = "model";
const car2 = {};
car2.manufacturer = "manufacturer";
car2.model = "model";
const arrayCars = [{
        cars: [car1, car2]
    }];
let mark1 = {
    subject: "OOP",
    mark: 7,
    done: true
};
let mark2 = {
    subject: "OOT",
    mark: 8,
    done: true
};
let mark3 = {
    subject: "TS",
    mark: 9,
    done: false
};
let student1 = {
    id: 1,
    name: "artem",
    group: 2,
    marks: [mark1, mark2]
};
let student2 = {
    id: 1,
    name: "vlad",
    group: 1,
    marks: [mark1, mark3]
};
let group = {
    students: [student1, student2],
    studentsFilter(group) {
        let resultArray = [];
        this.students.forEach(element => {
            if (element.group == group) {
                resultArray.push(element);
            }
        });
        console.log(resultArray);
        return resultArray;
    },
    marksFilter(mark) {
        let resultArray = [];
        this.students.forEach(element => {
            if (element.marks.includes(mark)) {
                resultArray.push(element);
            }
        });
        console.log(resultArray);
        return resultArray;
    },
    deleteStudent(id) {
        this.students = this.students.filter((student) => student.id !== id);
    },
    mark: 1,
    group: 1
};
console.log("------------------");
group.marksFilter(mark2);
console.log("--------filter student");
group.studentsFilter(1);
console.log("------------------");
console.log(group);
group.deleteStudent(1);
console.log("------------------");
console.log(group);
console.log("------------------");
