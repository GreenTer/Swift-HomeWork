// 1
//let student_1 = (name: "Alex", age: 20)
//let student_2 = (name: "Bob", age: 22)
//
//student_1.name
//student_2.name
//
//let student_3 = (nam: "Sam", ag: 23)
//
//student_3.nam


// 2
//class Student {
//    var name : String?
//    var age : Int?
//}
//
//let student_1 = Student()
//student_1.name = "Alex"
//student_1.age = 21


//3
//class Student {
//    var name : String
//    var age : Int
//
//    init() {
//        name = "No name"
//        age = 20
//    }
//
//    init(name: String, age: Int) {
//        self.name = name        // property name, это когда совпадают названия! В создании и инициализации
//        self.age = age
//    }
//}
//
//let student_1 = Student(name: "Bob", age: 18)
//student_1.name = "Alex"
//student_1.age = 21


//4
class StudentClass {
    var name : String
    var age : Int
    
    init() {
        name = "No name"
        age = 20
    }
    
    init(name: String, age: Int) {
        self.name = name        // property name, это когда совпадают названия! В создании и инициализации
        self.age = age
    }
}

struct StudentStruct {
    var name:String
    var age:Int
}

func addOneYear(student: inout StudentStruct) {
    student.age += 1
}


func addOneYear(student: StudentClass) {
    student.age += 1
}



let stClass = StudentClass(name: "Bob", age: 18)

stClass.name = "Alex"
stClass.age = 21

let stStruct = StudentStruct(name: "Sam", age: 24)

// разбор памяти Структуре!
var stStruct2 = stStruct        // новая переменная!! в Структуре
stStruct2.name = "Vasya"
stStruct2.age = 11
print(stStruct.age)
print(stStruct2.age)
addOneYear(student: &stStruct2)
print(stStruct.age)
print(stStruct2.age)



// разбор памяти Классов!
var stClass2 = stClass          // ссылка на переменную! поменяешь в одном месте, поменяется во всех!
print(stClass)
print(stClass2)

stClass2.name = "Aaa"
stClass2.age = 18

print(stClass.age)
print(stClass2.age)
addOneYear(student: stClass2)
print(stClass.age)
print(stClass2.age)


// Array
var arrrayStructs = [stStruct]
arrrayStructs[0]
arrrayStructs[0].age = 50           // no changes!
arrrayStructs[0]
print(stStruct)

var arrrayClasses = [stClass]
arrrayClasses[0]
arrrayClasses[0].age = 50           // changes!
arrrayClasses[0]
print(stClass.age)
