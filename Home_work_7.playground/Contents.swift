// 1. создать массив "дни в месяцах" 12 элементов содержащих количество дней в соответствующем месяце используя цикл for и этот массив
// - выведите количество дней в каждом месяце (без имен месяцев)
// - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
// - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
// - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
// - для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года
// 2. Сделайте первое задание к уроку номер 4 используя массивы: (создайте массив опшинал интов и посчитайте сумму)
// - в одном случае используйте optional binding
// - в другом forced unwrapping
// - а в третьем оператор ??
// 3. создайте строку алфавит и пустой массив строк в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед


print("TASK-1")
// 1. создать массив "дни в месяцах" 12 элементов содержащих количество дней в соответствующем месяце используя цикл for и этот массив
// - выведите количество дней в каждом месяце (без имен месяцев)
let days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for value in days_in_month {
    print("Days in month: \(value)")
}

// - используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
let month_in_year = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

print("\nDays and month (2 arrays)")
for (index, value) in month_in_year.enumerated() {
    print("\(value) - \(days_in_month[index])")
}

// - сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
let days_in_month_tuple = ["January" : 31, "February" : 28, "March" : 31, "April" : 30, "May" : 31, "June" : 30, "July" : 31, "August" : 31, "September" : 30, "October" : 31, "November" : 30, "December" : 31]

print("\nTuples-1 (будет в разнабой, т.к. tuple построен не грамотно! Грамотно, это в скобки через запятую let arr = [(month, days), (month, days)])")
for value in days_in_month_tuple {
    print("\(value.0) - \(value.1)")
}

print("\nTuples-2 (будет по порядку!)")
var days_in_month_tuple_2 = [(String, Int)]()                   // создаём грамотный tuple

for i in 0..<days_in_month.count {                              // задали цикл на 12 повторений
    let month = (month_in_year[i], days_in_month[i])            // привязываем месяц - день
    days_in_month_tuple_2.append(month)                         // добавляем в конец массива
}

for value in days_in_month_tuple_2 {
    print("\(value.0) - \(value.1)")                            // проходимся по массиву и выводим по порядку все значения
}

// - сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
print("\nTuples-3, воспроизводим в обратном порядке")
days_in_month_tuple_2[0].1                                      // как читать key/value in tuple

for index in 0..<days_in_month_tuple_2.count {
    let month_day = 11 - index
    print("\(days_in_month_tuple_2[month_day].0) - \(days_in_month_tuple_2[month_day].1)")
}

// Ввести месяц, день - посчитать количество дней, до этой даты с начала года
print("\nBirthday")
let my_birthday = ("July", 8)
var sum_days_birthday = 0

for value in days_in_month_tuple_2 {
    if my_birthday.0 == value.0 {
        print("\(sum_days_birthday + my_birthday.1) - days in this year, to my birthday")
    } else {
        sum_days_birthday += value.1
    }
}


print("\nTASK-2")
// 2. Сделайте первое задание к уроку номер 4 используя массивы: (создайте массив опшинал интов и посчитайте сумму)
// - в одном случае используйте optional binding
// - в другом forced unwrapping
// - а в третьем оператор ??

let var_1 : String? = "13"
let var_2 : String? = "15"
let var_3 : String? = "121df"
let var_4 : String? = "12"
let var_5 : String? = "asfsdf123"

let tuple_all_params = [var_1, var_2, var_3, var_4, var_5]

var sum_all_vars = 0

// - в одном случае используйте optional binding
print("Optional binding")

var optional_tuple = [Int?]()

// add optional params in tuple
for value in tuple_all_params {
    optional_tuple.append(Int(value!))
}

print(optional_tuple)

// value summary
for each in optional_tuple {
    if each != nil {
        sum_all_vars += each!
    }
}

print(sum_all_vars)

// - в другом forced unwrapping
print("\nForced unwrapping")

var forced_tuple = [Int]()

for each in tuple_all_params {
    if Int(each!) != nil {
        forced_tuple.append(Int(each!)!)
    }
}

print(forced_tuple)


// - а в третьем оператор ??
print("\nOperators ?? and forced unwrapping")

var forced_tuple_2 = [Int]()

for each in tuple_all_params {
    Int(each!) != nil ? forced_tuple_2.append(Int(each!)!) : nil
}

print(forced_tuple_2)

// ?? optional
print("\nOperators ?? and optional")

optional_tuple.removeAll()

for each in tuple_all_params {
    Int(each!) != nil ? optional_tuple.append(Int(each!)) : optional_tuple.append(Int(each!))
}

print(optional_tuple)


print("\nTASK-3")
// 3. создайте строку алфавит и пустой массив строк в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед
let alpha_bet = "abcdefghijklmnopqrstuvwxyz"
var alpha_bet_tuple = [String]()        // по порядку
var alpha_bet_tuple_back = [String]()   // задом на перёд

for each in alpha_bet {
    alpha_bet_tuple.append(String(each))
    alpha_bet_tuple_back.insert(String(each), at: 0)
}

print(alpha_bet_tuple)
print(alpha_bet_tuple_back)
