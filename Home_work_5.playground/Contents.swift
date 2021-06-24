//1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)
//2. Посчитайте в каком квартале вы родились
//3. Создайте пять переменных типа Инт и добавьте их в выражения со сложением, вычитанием, умножением и делением. В этих выражениях каждая из переменных должна иметь при себе унарный постфиксный или префиксный оператор. Переменные могут повторяться. Убедитесь что ваши вычисления в голове или на бумаге совпадают с ответом. Обратите внимание на приоритет операций
//4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h



print("TASK-1")
//1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)
let your_birthday = 1991

let b_years = 2020 - your_birthday
let b_days = b_years * 365
let b_min = b_days * 24 * 60
let b_sec = b_min * 60

print("You live \(b_years) years")
print("You live \(b_days) days")
print("You live \(b_min) min")
print("You live \(b_sec) sec")


print("\nTASK-2")
//2. Посчитайте в каком квартале вы родились
let your_month_birthday = 10

if your_month_birthday <= 3 {
    print("Your birthday in 1 qurtal")
} else if your_month_birthday > 3 && your_month_birthday <= 6 {
    print("Your birthday in 2 qurtal")
} else if your_month_birthday > 6 && your_month_birthday <= 9 {
    print("Your birthday in 3 qurtal")
} else if your_month_birthday > 9 && your_month_birthday <= 12 {
    print("Your birthday in 4 qurtal")
}


print("\nTASK-3")
//3. Создайте пять переменных типа Инт и добавьте их в выражения со сложением, вычитанием, умножением и делением.
// В этих выражениях каждая из переменных должна иметь при себе унарный постфиксный или префиксный оператор. (его уже нету в свифт, это типа ++)
var var_1 = 12
var var_2 = 17
var var_3 = 33
var var_4 = 112
var var_5 = 19

// создал массив, чтобы быстро их привести к Float, Double
var arrIntVars    = [var_1, var_2, var_3, var_4, var_5]
var arrFloatVars  = [Float]()
var arrDoubleVars = [Double]()

// цикл для записи в массив Float, Double
for value in arrIntVars {
    arrFloatVars.append(Float(value))   // Float
    arrDoubleVars.append(Double(value)) // Double
}

// Переменные могут повторяться. Убедитесь что ваши вычисления в голове или на бумаге совпадают с ответом. Обратите внимание на приоритет операций
var mathVars:       Int    = var_1 + var_2 * var_4 / var_3 - var_5                                                  // Int      = 50
var mathVarsFloat = arrFloatVars[0] + arrFloatVars[1] * arrFloatVars[3] / arrFloatVars[2] - arrFloatVars[4]         // Float    = 50.69697
var mathVarsDouble = arrDoubleVars[0] + arrDoubleVars[1] * arrDoubleVars[3] / arrDoubleVars[2] - arrDoubleVars[4]   // Double   = 50.69696969696969

// Цикл для вывода в консоль переменных и результатов
for index in 0..<arrFloatVars.count {
    print("Var_\(index+1): \(arrFloatVars[index])")
    
    if index + 1 == arrFloatVars.count {
        print("\nInt result: \(var_1) + \(var_2) * \(var_4) / \(var_3) - \(var_5) = \(mathVars)")
        print("Float result: \(var_1) + \(var_2) * \(var_4) / \(var_3) - \(var_5) = \(mathVarsFloat)")
        print("Double result: \(var_1) + \(var_2) * \(var_4) / \(var_3) - \(var_5) = \(mathVarsDouble)")
    }
}


print("\nTASK-4")
//4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h
let your_turn = (x : 5, y : 4)

print("Your turn is: \(your_turn.x), \(your_turn.y)")

if your_turn.0 % 2 == your_turn.y % 2 {
    print("Black")
} else  {
    print("White")
}
