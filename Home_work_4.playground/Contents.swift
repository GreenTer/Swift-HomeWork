//1. Создать пять строковых констант
//Одни константы это только цифры, другие содержат еще и буквы
//Найти сумму всех этих констант приведя их к Int
//(Используйте и optional banding и forced unwrapping)

//2. С сервера к нам приходит тюпл с тремя параметрами:
//statusCode, message, errorMessage (число, строка и строка)
//в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
//если statusCode от 200 до 300 исключительно, то выводите message,
//в противном случает выводите errorMessage
//После этого проделайте тоже самое только без участия statusCode

//3. Создайте 5 тюплов с тремя параметрами:
//имя, номер машины, оценка за контрольную
//при создании этих тюплов не должно быть никаких данных
//после создания каждому студенту установите имя
//некоторым установите номер машины
//некоторым установите результат контрольной
//выведите в консоль:
//- имена студента
//- есть ли у него машина
//- если да, то какой номер
//- был ли на контрольной
//- если да, то какая оценка


print("TASK-1")
//1. Создать пять строковых констант
//Одни константы это только цифры, другие содержат еще и буквы
let varA = "12"
let varB = "17"
let varC = "13ffadf"
let varD = "13"
let varE = "18"

print(
    "Константы:\n" +
    "varA = \(varA)\n" +
    "varB = \(varB)\n" +
    "varC = \(varC)\n" +
    "varD = \(varD)\n" +
    "varE = \(varE)\n"
)


// Найти сумму всех этих констант приведя их к Int (Используйте и optional banding и forced unwrapping)
// Forced unwrapping
var sumInt = 0  // sumInt - сразу будет Int

Int(varA) != nil ? sumInt += Int(varA)! : nil
Int(varB) != nil ? sumInt += Int(varB)! : nil
Int(varC) != nil ? sumInt += Int(varC)! : nil
Int(varD) != nil ? sumInt += Int(varD)! : nil
Int(varE) != nil ? sumInt += Int(varE)! : nil

print("Сумма всех констант, приведённых к Int = \(sumInt)")

// Optional banding
var sumOptional : Int? = 0

Int(varA) != nil ? sumOptional! += Int(varA)! : nil
Int(varB) != nil ? sumOptional! += Int(varB)! : nil
Int(varC) != nil ? sumOptional! += Int(varC)! : nil
Int(varD) != nil ? sumOptional! += Int(varD)! : nil
Int(varE) != nil ? sumOptional! += Int(varE)! : nil

/*
// это вариант через переменную в цикле!
if let a = Int(varC) {
    sumOptional! += a
} else {
    sumOptional! += 0
}
*/
print("Сумма всех констант, приведённых к Optional = \(String(describing: sumOptional))")


print("\nTASK-2")
//2. С сервера к нам приходит тюпл с тремя параметрами:
//statusCode, message, errorMessage (число, строка и строка)
//в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
var tupleStatusCode : (statusCode: Int, message: String, errorMessage: String)

tupleStatusCode.statusCode = 255
tupleStatusCode.message = "Your status code \(tupleStatusCode.statusCode)"
tupleStatusCode.errorMessage = "Error status code! Check your status code"

print("Tuple with status code:")

//если statusCode от 200 до 300 исключительно, то выводите message,
if tupleStatusCode.statusCode >= 200 && tupleStatusCode.statusCode <= 300 {
    print(tupleStatusCode.message)
} else {
    //в противном случает выводите errorMessage
    print(tupleStatusCode.errorMessage)
}

//После этого проделайте тоже самое только без участия statusCode
print("\nTuple without status code:")
// 1# вариант создания tuple
var tupleOptionalStatusCode : (statusCode: Int?, message: String, errorMessage: String) = (nil, "Hello", "Error")

// 2# вариант создания tuple
tupleOptionalStatusCode.statusCode = nil
tupleOptionalStatusCode.message = "Hello, Mister"
tupleOptionalStatusCode.errorMessage = "Error status code!\nCheck your status code"

if tupleOptionalStatusCode.statusCode != nil {

    if tupleOptionalStatusCode.statusCode! >= 200 && tupleOptionalStatusCode.statusCode! <= 300 {
        print(tupleOptionalStatusCode.message)
    } else {
        //в противном случает выводите errorMessage
        print(tupleOptionalStatusCode.errorMessage)
    }

} else {
    print("Your status code: \(String(describing: tupleOptionalStatusCode.statusCode))\n\(tupleOptionalStatusCode.errorMessage)\n")
}


print("\nTASK-3")
//3. Создайте 5 тюплов с тремя параметрами:
//имя, номер машины, оценка за контрольную
//при создании этих тюплов не должно быть никаких данных
var tupleStudent_1 : (name: String, carNumber: Int?, mark: String?)
var tupleStudent_2 : (name: String, carNumber: Int?, mark: String?)
var tupleStudent_3 : (name: String, carNumber: Int?, mark: String?)

//после создания каждому студенту установите имя
//некоторым установите номер машины
//некоторым установите результат контрольной
tupleStudent_1.name = "Sasha"
tupleStudent_1.carNumber = 2342
tupleStudent_1.mark = "A"

tupleStudent_2.name = "Dasha"
tupleStudent_2.carNumber = 3746
tupleStudent_2.mark = "C"

tupleStudent_3.name = "Lev"
tupleStudent_3.carNumber = nil
tupleStudent_3.mark = nil

let arrStudents = [tupleStudent_1, tupleStudent_2, tupleStudent_3] // создал массив, чтобы проще было выводить всех студентов

//выведите в консоль:
for each in arrStudents {
    //- имена студента
    print("Student \(each.name)")

    //- есть ли у него машина
    //- если да, то какой номер
    if each.carNumber != nil {
        print("Car number: \(each.carNumber!)")
    } else {
        print("Have not car..")
    }

    //- был ли на контрольной
    //- если да, то какая оценка
    if each.mark != nil {
        print("Mark \(each.mark!)\n")
    } else {
        print("Exam is not pass!\n")
    }
}







// новые знания - смотри урок 13!
/*
//1. Создать пять строковых констант
//Одни константы это только цифры, другие содержат еще и буквы
//Найти сумму всех этих констант приведя их к Int
//(Используйте и optional binding и forced unwrapping)
print("TASK 1")

func funcStringToInt(give_me_string: String) -> Int {
    var test = ""
    
    for value in give_me_string {
        switch value {
        case "0"..."9":
            test += String(value)
        default:
            break
        }
    }
    // так можно, но так неверно! может быть ошибка (если всунуть строку, без чисел!)
    //    test_Int = Int(test)! // forced unwrapping)
    //    return test_Int
    // этот способ, самый верный

    return Int(test) ?? 0
}
// начальные условия
let a1_Int = 5
let a2_String = "asd123asd"
let a3_String = "asdasdasd"
let a4_Double : Double = 3.3
let a5_Float : Float = 3.7

let a2_Int = funcStringToInt(give_me_string: a2_String)
let a3_Int = funcStringToInt(give_me_string: a3_String)
let a4_Int = Int(a4_Double)
let a5_Int = Int(a5_Float)

let sum_Int = a1_Int + a2_Int + a3_Int + a4_Int + a5_Int
// or second decition
/*let toInnt3 = Int(a3)
let toInnt4 = Int(a4)
toInnt3
toInnt4! + toInnt3!// 2 quest
var rezS : Int
rezS = a1 + a2 + a5 + toInnt4! + toInnt3!
*/


//2. С сервера к нам приходит тюпл с тремя параметрами:
//statusCode, message, errorMessage (число, строка и строка)
//в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
//если statusCode от 200 до 300 исключительно, то выводите message,
//в противном случает выводите errorMessage
//После этого проделайте тоже самое только без участия statusCode
print("TASK 2")

var serStatus_1 : (statusCode:Int, message:String?, errorMessage:String?)
serStatus_1.statusCode   = 321
serStatus_1.message      = "Hello 200-300"
serStatus_1.errorMessage = "Error"

if serStatus_1.statusCode <= 200 {
    print("\(String(describing: serStatus_1.statusCode))")
} else {
    if serStatus_1.statusCode > 300 {
        print("\(String(describing: serStatus_1.message))")
    } else {
        print("\(String(describing: serStatus_1.errorMessage))")
    }
}


//3. Создайте 5 тюплов с тремя параметрами:
//имя, номер машины, оценка за контрольную
//при создании этих тюплов не должно быть никаких данных
//после создания каждому студенту установите имя
//некоторым установите номер машины
//некоторым установите результат контрольной
//выведите в консоль:
//- имена студента
//- есть ли у него машина
//- если да, то какой номер
//- был ли на контрольной
//- если да, то какая оценка
print("TASK 3")

var student_0 : (name: String?, carNumber: Int?, mark: String?)
var student_1 : (name: String?, carNumber: Int?, mark: String?)
var student_2 : (name: String?, carNumber: Int?, mark: String?)
var student_3 : (name: String?, carNumber: Int?, mark: String?)
var student_4 : (name: String?, carNumber: Int?, mark: String?)

student_1.name = "Lena"
student_1.carNumber = 2732
student_1.mark = "A"

student_2.name = "Sasha"
student_2.carNumber = 2342
student_2.mark = "A"

student_3.name = "Lev"
student_3.mark = "C"

student_4.name = "Valera"

let student_Array = [student_1, student_2, student_3, student_4]

for each in student_Array {
    if each.name != nil && each.carNumber != nil && each.mark != nil {
        print("Name: \(each.name!) - Car Number: \(each.carNumber!) - Mark: \(each.mark!)")
    }
    
    if each.name != nil && each.carNumber == nil && each.mark != nil {
        print("Name: \(each.name!) - Mark: \(each.mark!)")
    }
}
*/
