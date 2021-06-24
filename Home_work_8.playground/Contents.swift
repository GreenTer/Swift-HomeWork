//1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение.
//   Некоторым студентам повысьте оценки - они пересдали.
//   Потом добавьте парочку студентов, так как их только что перевели к вам в группу.
//   А потом несколько удалите, так как они от вас ушли :(
//   После всех этих перетрубаций посчитайте общий бал группы и средний бал
//2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
//   В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.
//3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool.
//   Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.



//1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение
print("TASK-1")
var studentJornal = [String: Int]()

studentJornal["Borovitsky Sasha"] = 5
studentJornal.updateValue(5, forKey: "Borovitsky Lev")
studentJornal["Borovitsky Lev"] = 4
studentJornal["Borovitskaya Dasha"] = 3
studentJornal["Kylak Valeriy"] = 3
studentJornal["Babkin Sergey"] = 2

//   Некоторым студентам повысьте оценки - они пересдали. Разные варианты изменения показал
studentJornal.updateValue(5, forKey: "Borovitskaya Dasha")
studentJornal.updateValue(4, forKey: "Kylak Valeriy")
studentJornal["Babkin Sergey"] = 4

//   Потом добавьте парочку студентов, так как их только что перевели к вам в группу.
studentJornal.updateValue(4, forKey: "Eminem")

//   А потом несколько удалите, так как они от вас ушли :(
studentJornal["Kylak Valeriy"] = nil
studentJornal["Babkin Sergey"] = nil

//   После всех этих перетрубаций посчитайте общий бал группы и средний бал
var sumAllStudent = 0.0 // Double

for value in studentJornal {
    print("Mark: \(value.value) - \(value.key)")
    sumAllStudent += Double(value.value)    // считаем все баллы студентов
}

for index in 0...studentJornal.count {      // считаем средний балл
    if index == studentJornal.count {
        print("Mark: \(sumAllStudent / Double(index)) - Average score")
    }
}



print("\nTASK-2")
//2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
//   В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.
let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let monthInYear = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

//   Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение
var dictMonthDays = [String: Int]()

for value in monthInYear { // создаём словарь с месяцами и днями
    let month = value

    if month == value{
        for value2 in daysInMonth {
            let days = value2

            if days == value2 {
                dictMonthDays.updateValue(days, forKey: month)
            }
        }
    }
}

print("Dictionary [month : days]\n\(dictMonthDays)")

// выводим через tuples
print("\n\tTuples")

for index in 0..<daysInMonth.count {
    print("\(monthInYear[index]) - \(daysInMonth[index])")
}

// выводим через dictionary
print("\n\tDictionary")

for (key, value) in dictMonthDays {
    print("\(key) - \(value)")
}



print("\nTASK-3")
//3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool
var dictChess = [String: Bool]()

let tupleChessAlphaBet      = ["a", "b", "c", "d", "e", "f", "g", "h"]
let tupleChessAlphaNumbers  = [1, 2, 3, 4, 5, 6, 7, 8]

    // создаём цикл, для первой ячейки tupleChessAlphaNumbers
for index in 0..<tupleChessAlphaNumbers.count {
    let index = index
    
    if index == index {
        // создаём цикл, для всех возможных результатов 1ой ячейки tupleChessAlphaBet
        for index2 in 0..<tupleChessAlphaNumbers.count {
            
            // добавляем все значения для ходов а1, а2 и т.д. все 64 варианта
            let alphaNum = tupleChessAlphaBet[index] + String(tupleChessAlphaNumbers[index2])
            
            // добавляем Bool значения true/false - чтобы потом гооврить чёрное/белое (можно было сразу сделать в дикшенери String и вписать результат)
            let whiteBlack = (index+1 + index2+1) % 2 > 0 ? true : false
            
            // добавляем всё в дикшенери - конечный результат!
            dictChess.updateValue(whiteBlack, forKey: alphaNum)
        }
    }
}

//   Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.
let playerTurn = "e5"

for (key, value) in dictChess {
    if playerTurn == key {
        value == true ? print("Player turn: \(playerTurn) - White") : print("Player turn: \(playerTurn) - Black")
    }
}



/*
// этот вариант через case
var dict_Chess : [String: Bool?] = ["a1" : nil, "a2" : nil, "d4" : nil, "f1" : nil]

for (key,_) in dict_Chess {
    var keyString = [String]()
    
    if keyString.count <= 1 {
        for each in key {
            keyString.append(String(each))
        }
    }
    
    if keyString.count == 2 {
        switch keyString[0] {
        case "a","c","e","g":
            if Int(keyString[1])! % 2 == 0 {
                dict_Chess[key] = true
            } else {
                dict_Chess[key] = false
            }
        case "b","d","f","h":
            if Int(keyString[1])! % 2 == 1 {
                dict_Chess[key] = true
            } else {
                dict_Chess[key] = false
            }
        default:
            break
        }
        keyString.removeAll()
    }
}
print("\(dict_Chess)")
*/
