//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?
//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд) 50:10


print("TASK-1")
//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.
func family() -> String {
    return "👨‍👩‍👦"
}

func heart() -> String {
    return "💘"
}

func forever() -> String {
    return "♾"
}

print(family()+heart()+forever())   // конкатенация



print("\nTASK-2")
//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль
func chessTurnColor(tuple: (alpha: String, number: Int)) -> String {
    
    let arrPlayerTurns = [tuple]    // загоняем тюпл в массив, чтобы по нему проходиться
    var colorPlayer = ""            // переменная для сохранения и вывода цвета
    
    // защита от неправильных ходов
    if tuple.number > 0 && tuple.number < 9 {
        
        for (alpha, number) in arrPlayerTurns {
            
            switch alpha {              // для значения 'a'...'h' чтобы привести буквенный формат в цифры
            case "a","c","e","g":       // кейс для 1
                colorPlayer = 1 % number > 0 ? "◼︎ - white (\(tuple.alpha)\(tuple.number))" : "☐ - black (\(tuple.alpha)\(tuple.number))"
            case "b","d","f","h":       // кейс для 2
                colorPlayer = 2 % number > 0 ? "☐ - black (\(tuple.alpha)\(tuple.number))" : "◼︎ - white (\(tuple.alpha)\(tuple.number))"
            default:
                colorPlayer = "Sorry, check your turn! (\(tuple.alpha)\(tuple.number))"
                break
            }
        }
        
    } else {
        return "Sorry, check your turn! (\(tuple.alpha)\(tuple.number))"
//        colorPlayer = "Sorry, check your turn! (\(tuple.alpha)\(tuple.number))" // или присвоим colorPlayer (тогда выше return не нужен)
    }
    
    
    return colorPlayer
}

let chessPlayerTurn = (alpha: "a", number: 3)

print(chessTurnColor(tuple: chessPlayerTurn))



print("\nTASK-3")
//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.
func arrBack(giveMeArray: [String]) -> String {
    var arrBack = [String]()            // массив в который мы будем записывать в обратном порядке другой массив
    
    for (index, value) in giveMeArray.enumerated() {
        
        for each in value {
            let each = String(each)     // переведём в строку Character, чтобы всунуть в массив
            
            arrBack.insert(each, at: index)
        }
    }

    // функция которая переводит из массива в строку
    func arrToString(array: [String]) -> String {
        var strArr = String()           // строка в которую мы будем записывать массив
        
        for value in array {
            
            for each in value {
                strArr += String(each)  // запись массива в строку
            }
        }
        
        return strArr                   // возвращаем строку (массива)
    }

    return arrToString(array: arrBack)
}

let arrPlayer = ["abcdefghigklmnop"]

print("Строка:\n\(arrPlayer[0])\n\nОна же, наоборот:\n\(arrBack(giveMeArray: arrPlayer))")




print("\nTASK-4")
// 4  Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

//func fact(number: Int) -> Int {
//
//    if number <= 1 {
//        return 1
//    }
//
//    var f = 1
//    for i in 2...number {
//        f *= i
//    }
//    return f
//}

func fact(number: Int) -> Int {
    
    if number <= 1 {
        return 1
    }
    return number * fact(number: number - 1)
}
fact(number: 5)

// 4! work
var arr_1 = [1,2,3,4,5,6,7,8,9]

func reversArray(array: inout [Int]) {
    
    for each in array {
        array.insert(each, at: 0)
        array.removeLast()
    }
}

reversArray(array: &arr_1)
arr_1


// 5  Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

print("\nTASK-5")
//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд) 50:10
func cleanStr(giveMeStr: String) -> String {
    
    var str = ""                                // переменная в которую всё будем записывать
    
    for each in giveMeStr {                     // проходимся по массиву строки, которую будем обрабатывать
        
        switch each {                           // рассмотрим каждый символ, букву в массиве
        case "a", "e", "i", "o", "u", "y":
            str += each.uppercased()            // делаем все гласные БОЛЬШИМИ
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z":
            str += each.lowercased()            // делаем все согласные маленькими
        case ",", ".", "?", "!", ":", ";", "/":
            str += " "                          // ставим пробел вместо символов
        case  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            let arrStrNumb = ["0": "zero", "1": "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"]
                        
            for value in arrStrNumb {           // проходимся по массиву цифр - значение (arrStrNumb)
                let each = String(each)         // переводим Character в String
                
                
                if each == value.key {          // сверяем на совпадения цифры в тексте и в массиве (arrStrNumb
                    str += " \(value.value) "   // переводим цифры в фразу (9 -> nine)
                }
            }
        default:
            break
        }
    }
    
    return str
}

let str = "a8d7na3dfj.s0jd9hf2js,hdf4k0s1;j6hf5d"
print(cleanStr(giveMeStr: str))
