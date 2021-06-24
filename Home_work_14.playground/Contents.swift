//1. Повторить код Алексея из урока по памяти.
//2. Для этого же студента добавить свойства:
//-дата рождения (используя другую структуру)
//-возраст (вычисляется на основании даты рождения)
//-количество лет учебы (начиная с 6 лет, либо 0 если возраст меньше чем 6)
//3. Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
//Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
//-midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
//-длина отрезка (при изменении, точка "А" остается, а точка "В" движется)


//1. Повторить код Алексея из урока по памяти.
//import Foundation
//struct Student {
//
//    var firstName : String {
//        willSet {
//            print("New name: \(newValue) Instead of: " + firstName)
//        }
//        didSet {
//            firstName = firstName.capitalized
//            print("Did set: " + firstName + " Instead of: \(oldValue)")
//        }
//    }
//
//    var lastName : String {
//        didSet {
//            lastName = lastName.capitalized
//        }
//    }
//
//    var fullName : String {
//        get {
//            return firstName + " " + lastName
//        }
//        set {
//            let words = newValue.components(separatedBy: " ")
//
//            if words.count > 0 {
//                firstName = words[0]
//            }
//
//            if words.count > 1 {
//                lastName = words[1]
//            }
//        }
//    }
//}
//
//var student_1 = Student(firstName: "Sasha", lastName: "Borovitsky")
//student_1.fullName = "Hello Word"
//student_1.fullName


print("\nTASK - 2")
//2. Для этого же студента добавить свойства:
//-дата рождения (используя другую структуру)
//-возраст (вычисляется на основании даты рождения)
//-количество лет учебы (начиная с 6 лет, либо 0 если возраст меньше чем 6)
import Foundation

class Student {

    // условия создания студента (всё необходимое)
    init(name: String, lastName: String, birthday: DayOfBirthday) {
        self.name = name.capitalized
        self.lastName = lastName.capitalized
        self.birthday = birthday
    }
    
    // всё что отвечает за "Имя", "Фамилию", вывод "Имени и фамилии"
    var name: String {
        didSet {
            name = name.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
    }
    
    var fullName: String {
        get {
            name + " " + lastName
        }
        set {
            let newStudent = newValue.components(separatedBy: " ")
            
            if newStudent.count == 2 {
                name = newStudent[0]
                lastName = newStudent[1]
            }
        }
    }

    // всё что отвечает за рождение
    struct DayOfBirthday { // условия даты рождения
        var day: Int
        var month: Month
        var year: Int
    }

    // крутой метод rawValue - начало от чего задали, остальные подставятся автоматически
    enum Month: Int {
        case January = 1, February, March, April, May, June, July, August, September, October, November, December
    }

    // переменная отвечающая за день рождения
    var birthday: DayOfBirthday
    
    // создал для быстрого вывода даты рождения
    var wasBorn: String {
        get {
            (String(birthday.day) + "." + String(birthday.month.rawValue) + "." + String(birthday.year))
        }
    }
}

// студенты
var student1 = Student.init(name: "Sasha", lastName: "Borovitsky", birthday: .init(day: 08, month: .July, year: 1991))
var student2 = Student.init(name: "Lev", lastName: "Borovitsky", birthday: .init(day: 24, month: .April, year: 2016))

// массив студентов
let arrStudents = [student1, student2]

// func выводящая студентов
func showStudents(gMeArr: [Student]) {
    
    for each in gMeArr {
        
        let stuYears = 2020 - each.birthday.year
        
        print("\(each.fullName) was born \(each.wasBorn)")
        
        switch stuYears {
        case _ where stuYears > 6:
            print("Finished kindergarten in \(each.birthday.year + 6)")
            
            if stuYears > 17 {
                print("Finished school in \(each.birthday.year + 17)\n" +
                "Nowadays - worker")
            }
        default:    // проверку на минусовой возраст не делал
            print("Went's in kindergarten, around \(2020 - each.birthday.year - 2) years")
        }
        
        print("\n")
    }
}

showStudents(gMeArr: arrStudents)

/* 2019 year
import UIKit
// условия, для подсчета времени со дня рождения
let today   = Calendar.init(identifier: .gregorian)
let dmy     = today.dateComponents([.day, .month, .year], from: Date())

struct Student {

    var firstName : String {
        willSet {
            print("New name: \(newValue) Instead of: " + firstName)
        }
        didSet {
            firstName = firstName.capitalized
            print("Did set: " + firstName + " Instead of: \(oldValue)")
        }
    }

    var lastName : String {
        didSet {
            lastName = lastName.capitalized
        }
    }

    var fullName : String {
        get {
            return firstName + " " + lastName
        }
        set {
            let words = newValue.components(separatedBy: " ")

            if words.count > 0 {
                firstName = words[0]
            }

            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    //-дата рождения (используя другую структуру)
    struct Birthday {
        var year    : Int
        var month   : Int
        var day     : Int
    }
    
    var yourBirthday : Birthday
    // переменная, для подсчета лет учебы (используем в yourAgeToNextBirthday)
    static var ageForStudy = 0
    //-возраст (вычисляется на основании даты рождения)
    var myAgeToNextBirthday : String {
        let birthdayMonth   = dmy.month! - yourBirthday.month
        let birthdayDay     = dmy.day! - yourBirthday.day
        let birthdayYear    = dmy.year! - yourBirthday.year
        
        if birthdayMonth == 0 {
            
            if birthdayDay == 0 {
                Student.ageForStudy = birthdayYear
                return "Now Age: \(birthdayYear)! Next birthday from: \(12) - month & \(birthdayDay) - days"
                
            } else if birthdayDay > 0 {
                Student.ageForStudy = birthdayYear
                return "Now Age: \(birthdayYear)! Next birthday from: \(11) - month & \(yourBirthday.day + birthdayDay) - days"
                
            } else {
                Student.ageForStudy = birthdayYear
                return "Now Age: \(birthdayYear)! Next birthday from: \(birthdayMonth) - month & \(birthdayDay * -1) - days"
            }
            
        } else {
            Student.ageForStudy = birthdayYear - 1
            return "Now Age: \(birthdayYear - 1)! Next birthday from: \(birthdayMonth * -1 - 1) - month & \(birthdayDay) - days"
        }
    }
    //-количество лет учебы (начиная с 6 лет, либо 0 если возраст меньше чем 6)
    var myAgeStudy : String {
        if Student.ageForStudy > 6 {
            return "Sadic +"
        } else {
            return "Sadic -"
        }
    }
}

let student_1 = Student.init(firstName: "Sasha", lastName: "Borovitsky", yourBirthday: Student.Birthday(year: 1991, month: 7, day: 8))
// mistake!
student_1.myAgeToNextBirthday
student_1.myAgeStudy
 */


print("\nTASK - 3")
//3. Создать структуру "отрезок", у которой два свойства - точка "А" и точка "В", которые в свою очередь тоже структуры (не стандартные, а наши собственные)
//Также отрезок имеет вычисляемые свойства (они изменяют точки "А" и "В", если мы изменяем следующие свойства):
//-midPoint - середина отрезка (при её изменении, отрезок смещается на параллельную прямую, проходящую через наш midPoint?)
//-длина отрезка (при изменении, точка "А" остается, а точка "В" движется)
import UIKit

struct Line {
    
    // параметры отрезка
    struct Point {
        var x: Double
        var y: Double
    }
    
    // отрезки А и Б
    let pointA: Point
    var pointB: Point
    
    // параметр вывода координат отрезков (А, Б)
    var showLine: (Point, Point) {
        return (Point.init(x: pointA.x, y: pointA.y), Point(x: pointB.x, y: pointB.y))
    }
    
    // середина отрезка (и условия: если меняешь середину отрезка, меняется отреок Б а А - остаётся неизменным)
    var midPoint: Point {
        get {
            let midPoint_X = (pointA.x + pointB.x) / 2
            let midPoint_Y = (pointA.y + pointB.y) / 2
            
            return Point(x: midPoint_X, y: midPoint_Y)
        }
        set {
//            pointA.x = newValue.x * 2 - pointB.x
//            pointA.y = newValue.y * 2 - pointB.y
            
            pointB.x = newValue.x * 2 - pointA.x
            pointB.y = newValue.y * 2 - pointA.y
        }
    }
    
    // формула высчитывания длинны отрека sqrt() - квадратный корень, pow(Num, Stepen) - квадрат
    var lenght: Double {

        // чёткая формула
        let lenghtAB = sqrt(pow(pointA.x - pointB.x, 2) + pow(pointA.y - pointB.y, 2))
        
        return lenghtAB
    }
}

// функция вывода всех данных
func gMeLine(line: Line) {
    print("Point A:      (x: \(line.pointA.x), y: \(line.pointA.y))")
    print("Point B:      (x: \(line.pointB.x), y: \(line.pointB.y))")
    print("Mid point AB: (x: \(line.midPoint.x), y: \(line.midPoint.y))")
    print("Lenght AB:    \(line.lenght)\n")
}

var line_1 = Line.init(pointA: .init(x: 1, y: 1), pointB: .init(x: 5, y: 5))

gMeLine(line: line_1)

// изменил данные midPoint, отрезок А не изменный (по условию)! а Б - изменился (всё верно работает!!! кайф)
line_1.midPoint.x = 13
line_1.midPoint.y = 17

gMeLine(line: line_1)
