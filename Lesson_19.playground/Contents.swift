// Помни, что к любому конструктору - можно добавлять несколько инициализаторов

// class Student
class Student {
    var firstName: String
    var lastName: String
    
    var fullName: String {
        firstName + " " + lastName
    }

    init() {                        // нужен инициализатор, т.к. не задали изначально параметры
//        self.firstName = ""
//        self.lastName = ""
                                    // если локальных переменных нету, то self не нужен
        firstName = ""
        lastName = ""
    }
}

let s1 = Student()


// class Student 2
class Student2 {                    // инициализатор не нужен, т.к. задали параметры
    var firstName = ""
    var lastName = ""
}

let s2 = Student2()


// class Student 3
class Student3 {
    var firstName: String
    var lastName: String
                                    // инициализатор с названиями (если поставить While card (_) то названия будут скрыты при создании
                                    // init( _ firstName: String, _ lastName: String) {}
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

let s3 = Student3(firstName: "Aliaksandr", lastName: "Borovitsky")


// class Student 4
class Student4 {                    // инициализатор не нужен при ОПЦИОНАЛЕ
    var middleName: String?
}


// class Student 5
class Student5 {
    let maxAge: Int
                                    // константы - невозможно поменять!
    init() {
        maxAge = 100
    }
}

var s5 = Student5()
//s5.maxAge = 90


// class Student 6
class Student6: Student5 {
                                    // невозможно поменять константу РОДИТЕЛЬСКОГО класса!
    override init() {
//        maxAge = 100
//        self.maxAge = 110
//        super.maxAge = 110
    }
}

var s6 = Student6()
//s6.maxAge


// struct Student7
struct Student7 {
    var firstName: String
    var lastName: String
}

let s7 = Student7(firstName: "Sasha", lastName: "Borovitsky")












// Designattor - если это родительский класс, то он обязательно должен задать все наши property
// Convenience - заканчивается на Designattor, который внутри этого класса! (нужен для дополнительных конструкторов при создании, с одним+ параметрами)
class Human {
    var weight: Int
    var age: Int
    
    // Designattor
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    // Designattor чисто с параметром age (weight устанавливаем дефолтное = 0 )
//    init(age: Int) {
//        // для инициализации только возраста
//        self.age = age
//        // ставим дефолтное значение весу
//        self.weight = 0
//    }

    // Convenience 1
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    // Convenience 2
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    // Convenience 3
    convenience init() {
        self.init(weight: 0)
    }
    
    // func - для примера, как добавлять в последующих классах (см StudentH: Human)
    func test() {}
    
}

let h1 = Human(weight: 80, age: 29)
let h2 = Human(age: 30)
let h3 = Human()


// StudentH
class StudentH: Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        // создать инициализацию Designattor для StudentH
        self.firstName = firstName
        self.lastName = lastName

        // и после Designattor StudentH, инициализировать property родительского класса! (это правило!)
        // в Designattor, используется только super к init
        super.init(weight: 0, age: 0)
        
        test()
        self.weight = 50
        test()
    }
    
    // Convenience
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
    }
}

let student9 = StudentH(firstName: "Sasha")
// P.S.
// Phase initialization - это соблюсти иерархию иницализации от наследуемых родителей
// Phase 1 initialization - это инициализация в самом классе
// Phase 2 initialization - это инициализация property родительского класса

// создать инициализацию Designattor
// в Designattor, используется только super к init

// в Convenience используется только self  !!
