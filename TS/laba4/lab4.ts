//z1

type users = {
    id: number
    name: string
    groupelem: number
}

const array: users[] = [
    {id: 1, name: "Vasya", groupelem: 10},
    {id: 2, name: "Ivan", groupelem: 11},
    {id: 3, name: "Misha", groupelem: 12},
    {id: 4, name: "Petya", groupelem: 10},
    {id: 5, name: "Kira", groupelem: 11}
]

//z2

type CarsType = {
    manufacturer?: string
    model?: string
}

let car: CarsType = {}

car.manufacturer = "manufacturer";
car.model = "model";

//z3

const car1: CarsType = {}
car1.manufacturer = "manufacturer";
car1.model = "model";


const car2: CarsType = {}
car2.manufacturer = "manufacturer";
car2.model = "model";


type ArrayCarsType = {
    cars: CarsType[]
}

const arrayCars: Array<ArrayCarsType> = [{
    cars: [car1, car2]
}];


// task 4

type MarkFilterType = 1|2|3|4|5|6|7|8|9|10

type DoneType = true|false

type groupelemFilterType = 1|2|3|4|5|6|7|8|9|10|11|12


type MarkType = {
    subject: string,
    mark: MarkFilterType, // может принимать значения от 1 до 10
    done: DoneType,
}
type StudentType = {
    id: number,
    name: string,
    groupelem: groupelemFilterType, // может принимать значения от 1 до 12
    marks: Array<MarkType>,
}

type groupelemType = {
    students: Array<StudentType>// массив студентов типа StudentType
    studentsFilter: (groupelem: number) => Array<StudentType>, // фильтр по группе
    marksFilter: (mark: MarkType) => Array<StudentType>, // фильтр по  оценке
    deleteStudent: (id: number) => void, // удалить студента по id из  исходного массива
    mark: MarkFilterType,
    groupelem: groupelemFilterType,
}

let mark1 : MarkType = {
subject: "OOP",
mark: 7,
done: true

}

let mark2 : MarkType = {
    subject: "OOT",
    mark: 8,
    done: true
    
}

let mark3 : MarkType = {
    subject: "TS",
    mark: 9,
    done: false
    
}


let student1 : StudentType = {
id: 1,
name:"artem",
groupelem: 2,
marks:[mark1,mark2]

}

let student2 : StudentType = {
    id: 1,
    name:"vlad",
    groupelem: 1,
    marks:[mark1,mark3]
    
}
    


let groupelem: groupelemType = {
    students: [student1,student2],

    studentsFilter(groupelem:number){
        let resultArray: Array<StudentType> = []

        this.students.forEach(element => {
            if(element.groupelem == groupelem){
                resultArray.push(element)
            }
        });
        console.log(resultArray)
        return resultArray
    },

    marksFilter(mark: MarkType){
        let resultArray: Array<StudentType> = []

        this.students.forEach(element => {
           
            if(element.marks.includes(mark)){
                    resultArray.push(element)
            }
            
        });
        console.log(resultArray)
        return resultArray
    },

    deleteStudent(id:number){
        this.students = this.students.filter((student) => student.id !== id);
    },
    mark: 1,
    groupelem: 1

}
console.log("------------------")
groupelem.marksFilter(mark2);
console.log("--------filter student")

groupelem.studentsFilter(1)
console.log("------------------")
console.log(groupelem)
groupelem.deleteStudent(1);
console.log("------------------")
console.log(groupelem)
console.log("------------------")

