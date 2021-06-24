import Foundation // add addon for object-c (all function with NString)
// 1.0 Stored Properties - они сохраняют значения
//struct Student {
//    var firstName : String {
//
//        willSet(newFirstName) { // String - like firstName : String
//            print("will set " + newFirstName + " instead of " + firstName)
//        }
//        didSet(oldFirstName) {
//            print("did set " + firstName + " instead of " + oldFirstName)
//
//            firstName = firstName.capitalized // object-c Capitalized first element !
//        }
//    }
//}
//
//var student_1 = Student(firstName: "Sasha")
//student_1.firstName = "ALEX"
//student_1.firstName

// 1.1 without var in willSet and oldSet (newValue)
//struct Student {
//    var firstName : String {
//
//        willSet { // String - like firstName : String
//            print("will set " + newValue + " instead of " + firstName)
//        }
//        didSet {
//            print("did set " + firstName + " instead of " + oldValue)
//
//            firstName = firstName.capitalized // object-c Capitalized first element !
//        }
//    }
//}
//
//var student_1 = Student(firstName: "Sasha")
//student_1.firstName = "ALEX"
//student_1.firstName


//// 2.0 Computer Properties - не сохраняет значения сами в себя! Они используют другие переменные, для того чтобы сохранять и чтобы потом брать от туда информацию, и потом выдавать ее!
//struct Student {
//
//    var firstName : String {
//        willSet { // String - like firstName : String
//            print("will set " + newValue + " instead of " + firstName)
//        }
//        didSet {
//            print("did set " + firstName + " instead of " + oldValue)
//
//            firstName = firstName.capitalized // object-c Capitalized first element !
//        }
//    }
//
//    var lastName : String {
//        didSet {
//            lastName = lastName.capitalized // object-c Capitalized first element !
//        }
//    }
//
//    var fullName : String {
////        get {                                 // get так правильно оформляется
////            return firstName + " " + lastName
////        }
//        return firstName + " " + lastName       // get не используем, так как у нас только один getter
//    }
//}
//
//var student_1 = Student(firstName: "Sasha", lastName: "Borovitsky")
//student_1.fullName
//student_1.firstName = "LEV"
//student_1.firstName
//student_1.fullName

// 2.1 Computer Properties
struct Student {
    
    var firstName : String {
        willSet { // String - like firstName : String
            print("will set " + newValue + " instead of " + firstName)
        }
        didSet {
            print("did set " + firstName + " instead of " + oldValue)
            
            firstName = firstName.capitalized // object-c Capitalized first element !
        }
    }
    
    var lastName : String {
        didSet {
            lastName = lastName.capitalized // object-c Capitalized first element !
        }
    }
    
    var fullName : String {
        get {                                 // get так правильно оформляется
            return firstName + " " + lastName
        }
        set {                                 // newValue да]тся переменная по умолчанию, либо в скобочках задать свою
            print("fullName wants to be set to " + newValue)
            
            let words = newValue.components(separatedBy: " ") // object-c (разбивает строку - на массивы, условия задали, что один объект записывается как наступает пробел и т.д. )
            
            if words.count > 0 {
                firstName = words[0]
            }
            
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
}

var student_1 = Student(firstName: "Sasha", lastName: "Borovitsky")
//student_1.firstName = "LEV"
//student_1.fullName
student_1.fullName = "saSHa borOVitsky"
student_1.fullName
