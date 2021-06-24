//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.
//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную. используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.
//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы
//5. Проделайте задание №3 но для нахождения минимальной и максимальной буквы из массива букв (соответственно скалярному значению)



print("TASK-1")
//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.

func nothing(clousers: () -> ()) {
    
    for index in 1...10 {
        print("\(index) Function start")
    }
    
    clousers()

}

nothing   {print("Closures end\n")}               // 1
nothing() {print("Closures end\n")}               // 2
nothing(clousers: {print("Closures end\n")})      // 3



print("\nTASK-2")
//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.
let arrNumbers = [1,3,4,2,1,7]

print(arrNumbers.sorted{$0 < $1}) // SortedUp
print(arrNumbers.sorted{$0 > $1}) // SortedDown



// 3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
func sortArray(giveMassive: [Int], clouser:(Int?, Int) -> Bool) -> Int {
    var optionalVar : Int?
    
    for value in giveMassive {
        if clouser(optionalVar, value) {
            optionalVar = value
        }
    }
    return optionalVar ?? 0
}

//let test =
//    sortSomething(giveMassive: sortedVar) { (a,b) in
//        a == nil || a == b
//}
let array = [13,123,1,412,1,31,2,3,1,31,4,2,3,123,1,2312,3,12,3,123]
let test =
    sortArray(giveMassive: array) {
        $0 == nil || $0! == $1
    }

// variant 2
func sortArray2(array:[Int], clouser:(Int?, Int) -> Bool ) -> Int {
    var optVar : Int?
    
    optVar = optVar ?? array[0]
    
    for value in array {
        if clouser(optVar, value) {
            optVar = value
        }
    }
    return optVar!
}

let test2 = sortArray2(array: array) {$0! < $1}
test2


// 4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

let someString = "sdkufhgsdfklnsajdfhipsjdfuigasyidgfja[spoekfsjd1234357579878089-0vmlnzxm,cvniqpwherkjpq[]owldmmzncvcm,bsxpkbasydfgsaiuybdf;l"

var someArray   = [String]()
var someString2 = String()
var glasniye    = String()
var soglasniye  = String()
var numbers     = String()
var symbols     = String()

for value in someString.lowercased().sorted() {
    switch value {
    case "a", "e", "i", "o", "u":
        glasniye += String(value)
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        soglasniye += String(value)
    case "(", ")", "[", "]", ";", "'", ",", ".", "-":
        symbols += String(value)
    case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
        numbers += String(value)
    default:
        break
    }
    someString2 = glasniye + soglasniye + numbers + symbols
}

for value in someString2 {
    someArray.append(String(value))
}
someArray

// 4.1
func priority(string:String) -> Int {       // приравняем буквы к приоритету цифр
    switch string.lowercased() {
    case "a", "e", "i", "o", "u": return 0
    case "a"..."z": return 1
    case "0"..."9": return 2
    default: return 3
    }
}

let a = "a"
let b = "b"

switch (priority(string: a), priority(string: b)) {
case let(x,y) where x < y: print(a)	
case let(x,y) where x > y: print(b)
default: print(a <= b ? a : b )
}

// 4.2
let str = "sdlkhjgbsajknvisdjbvuj;sndu;AHBDFLJKDFJAK:BFvohn178394618709y3rjkwebfjkbsdhiuygsuiyr7926eruihfsdjkbvhjsxcgviuoy"
var arr = [String]()

for c in str.lowercased() {     // строку перевели в массив для свича
    arr.append(String(c))
}
arr

let sorted =
    arr.sorted() {              // отсортируем массив по своим правилам
        switch (priority(string: $0), priority(string: $1)) {   // используя приоритет (там где букву привели к цифрам)
        case let(x,y) where x < y: return true                  // условия на сравнения цифр
        case let(x,y) where x > y: return false
        default: return $0 <= $1                                // в любом другом случае, использовать это
        }
}
sorted

// or
let test_2 =
    arr.sorted() { x,y in
        switch(priority(string: x), priority(string: y)) {
        case let(f,k) where f < k : return true
        case let(f,k) where f > k : return false
        default: return x <= y
        }
}

test_2
sorted
