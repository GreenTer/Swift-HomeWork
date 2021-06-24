class Human {
    
    var firstName: String = ""
    var lastName: String = ""
    var fullName: String {
        return firstName + " " + lastName
    }
    
    func sayHello() -> String {
        return "Hello"
    }
}

// наследование Человека, обсалютно все будет в студенте
class Student: Human {
    // полное переопределение метода!
//    override func sayHello() -> String {
//        return "Sup!"
//    }
    // частичное переопределение метода! (сохраняя старый + Добавляя новый)
    override func sayHello() -> String {
        return super.sayHello() + " my friend!"
    }
}


class Kid: Human {
    
    var favoriteToy : String = "iMac"
    
    override func sayHello() -> String {
        return "Agu.."
    }
    
    override var firstName: String {
        set {
            super.firstName = newValue + " :)"
        }
        get {
            return super.firstName
        }
    }
    
    override var lastName: String {
// так тоже можно, не знаю - почему Скутаренко написал как ниже
        //        willSet {
//            print("New value " + newValue)
//        }
        didSet {
            print("New value last name: " + self.lastName)
        }
    }
    
    override var fullName: String {
        return firstName
    }
}

// 3 этажная иерархия
class SmartHuman: Student {
    
}

let human_1 = Human()
human_1.firstName = "Sasha"
human_1.lastName = "Borovitsky"
human_1.sayHello()

let student_1 = Student()
student_1.firstName = "Dasha"
student_1.lastName = "Borovitskaya"
student_1.sayHello()

let kid_1 = Kid()
kid_1.firstName = "Lev"
kid_1.lastName = "Borovitsky"
kid_1.fullName
kid_1.favorwiteToy
kid_1.sayHello()

// массив с наследованием Human (писать именно его, ненадо как в примере ниже, свифт сам всё понимает)
let array: [Human] = [kid_1, student_1, human_1]

for value in array {
    print(value.sayHello())
}
