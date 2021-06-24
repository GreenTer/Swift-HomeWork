//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?


//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
print("Task 1")

struct Student {
    var name: String
    var lastName: String
    var birthday: Int
    var mark: Double
}

let student1 = Student.init(name: "Sasha", lastName: "Borovitsky", birthday: 1991, mark: 5)
let student2 = Student.init(name: "Dasha", lastName: "Borovitskaya", birthday: 1991, mark: 3)
let student3 = Student.init(name: "Lev", lastName: "Borovitsky", birthday: 2016, mark: 4)



print("\nTask 2\n")
//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
let arrStudents = [student1, student2, student3]

func gMeArr(arr: [Student]) {
    
    for (index, each) in arr.enumerated() {
        
        print("\(index+1). \(each.lastName) \(each.name) was born in \(each.birthday), mark: \(each.mark)\n")
    }
}

gMeArr(arr: arrStudents)



print("\nTask 3\n")
//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
let arrSortStudent = arrStudents.sorted(by: {$0.mark > $1.mark})

gMeArr(arr: arrSortStudent)



print("\nTask 4\n")
//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
let arrSortStudent2 = arrStudents.sorted(by: {
    if $0.lastName == $1.lastName {
        return $0.name < $1.name
    }

    return $0.lastName < $1.lastName
})

gMeArr(arr: arrSortStudent2)



print("\nTask 5\n")
//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
var newArrStuden = arrStudents
newArrStuden[0].name = "Valera"
newArrStuden[0].lastName = "Kylak"
newArrStuden[0].birthday = 1991
newArrStuden[0].mark = 4

newArrStuden[1].name = "Alexander"
newArrStuden[1].lastName = "Chaus"
newArrStuden[1].birthday = 1990
newArrStuden[1].mark = 3

newArrStuden[2].name = "Andrey"
newArrStuden[2].lastName = "Solovey"
newArrStuden[2].birthday = 1992
newArrStuden[2].mark = 4

print("Array 1")
gMeArr(arr: arrStudents)

print("\nArray 2")
gMeArr(arr: newArrStuden)



print("\nTask 6\n")
//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?

// создать CLASS
class Family {
    var name: String
    var lastName: String
    var birthday: Int

    init() {
        name = ""
        lastName = ""
        birthday = 0
    }
    
    init(name: String, lastName: String, birthday: Int) {
        self.name = name
        self.lastName = lastName
        self.birthday = birthday
    }
}

// добавили членов семьи
var husbend = Family.init(name: "Sasha", lastName: "Borovitsky", birthday: 1991)
let wife = Family.init(name: "Dasha", lastName: "Borovitskaya", birthday: 1991)
let son = Family.init(name: "Lev", lastName: "Borovitsky", birthday: 2016)

// добавили всех членов семьи в массив
let arrFamily = [husbend, wife, son]

// создали функцию, которая выводит членов семьи
func gMeArrFamily(arr: [Family]) {
    
    for (index, each) in arr.enumerated() {
        print("\(index+1). \(each.name) \(each.lastName) \(each.birthday)")
    }
}

gMeArrFamily(arr: arrFamily)

// отсортировали членов семьи по имени (в алфавитном порядке)
print("\nSorted by: Name")
let arrFamilySorted = arrFamily.sorted(by: { $0.name < $1.name })

gMeArrFamily(arr: arrFamilySorted)

// отсортировали членов семьи (ниже условия)
print("\nSorted by last name -> if ==, sorted by birthday..")
let arrFamilySorted2 = arrFamily.sorted(by: {
    switch ($0, $1) {
    case let (a,b) where a.lastName == b.lastName:
        return a.birthday > b.birthday
    default:
        return $0.name < $1.name
    }
})

gMeArrFamily(arr: arrFamilySorted2)

// скопировали члена семьи + поменяем в нём данные и убедимся в том, что в обоих случаях всё поменяется
var husbend2 = husbend

husbend2.birthday = 2000

husbend2.birthday
husbend.birthday





/*
//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?


//1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).
print("Task 1")
struct Student {
    var name:String
    var serName:String
    var age:Int
    var gpa:Double
}

let student_1 = Student.init(name: "Alex", serName: "Borovitsky", age: 27, gpa: 4.9)
let student_2 = Student.init(name: "Lev", serName: "Borovitsky", age: 3, gpa: 5.0)
let student_3 = Student.init(name: "Valera", serName: "Kylak", age: 27, gpa: 3.1)
let student_4 = Student.init(name: "Sonya", serName: "Sonkova", age: 23, gpa: 3.9)

var arrayStudent = [student_1, student_2, student_3, student_4]


//2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
print("Task 2")
func PrintStudent(student: [Student]) {
    for (index,value) in student.enumerated() {
        print("\(index+1). \(value.serName) - \(value.name) - \(value.age) GPA: \(value.gpa)")
    }
}

PrintStudent(student: arrayStudent)


//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
print("Task 3")
PrintStudent(student: arrayStudent.sorted {
    $0.gpa > $1.gpa
})


//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
print("Task 4")
PrintStudent(student: arrayStudent.sorted {
    if $0.serName == $1.serName {
        return $0.name < $1.name
    } else {
        return $0.serName < $1.serName
    }
    
})


//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.
print("Task 5")
var arrayStudent_2 = arrayStudent
arrayStudent_2[0].name = "Sasha"

print("\(arrayStudent)")
print("\(arrayStudent_2)")


//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?
print("Task 6")
class Class_Student {
    var name:String
    var serName:String
    var age:Int
    var gpa:Double
    
    init(name:String, serName:String, age:Int, gpa:Double) {
        self.name = name
        self.serName = serName
        self.age = age
        self.gpa = gpa
    }
}

let student_1_class = Class_Student.init(name: "Vasya", serName: "Konovalchik", age: 64, gpa:4.0)
let student_2_class = Class_Student.init(name: "Petya", serName: "Pupkin", age: 44, gpa:4.5)

var arrayClass_Student = [student_1_class, student_2_class]

func PrintStudent_2(student: [Class_Student]) {
    for (index,value) in student.enumerated() {
        print("\(index+1). \(value.serName) - \(value.name) - \(value.age) GPA: \(value.gpa)")
    }
}

PrintStudent_2(student: arrayClass_Student)

var arrayClass_Student_2 = arrayClass_Student
arrayClass_Student_2[0].name = "PPP"
// поменял во втором массиве, поменялся и в первом!..
PrintStudent_2(student: arrayClass_Student.sorted {
    $0.name < $1.name
})
*/
