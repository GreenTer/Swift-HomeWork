// 1. Выполните задание #1 урока о базовых операторах: http://vk.com/topic-58860049_31536965 только вместо forced unwrapping и optional binding используйте оператор ?? Когда посчитаете сумму, то представьте свое выражение в виде строки Например: 5 + nil + 2 + 3 + nil = 10 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
// 2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов, можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C
// 3. Создайте строку английский алфавит, все буквы малые от a до z задайте константу - один из символов этого алфавита. Используя цикл for определите под каким индексом в строке находится этот символ



print("TASK-1")
// 1. Выполните задание #1 урока о базовых операторах: http://vk.com/topic-58860049_31536965 только вместо forced unwrapping и optional binding используйте оператор ?? Когда посчитаете сумму, то представьте свое выражение в виде строки Например: 5 + nil + 2 + 3 + nil = 10 но в первом случае используйте интерполяцию строк, а во втором конкатенацию
import Foundation

// #1
print("Variant - 1")

let var1 = "1"
let var2 = "2a"
let var3 = "2"
let var4 = "4life"
let var5 = "32"

// number
var number1 = Int(var1) ?? 0
var number2 = Int(var2) ?? 0
var number3 = Int(var3) ?? 0
var number4 = Int(var4) ?? 0
var number5 = Int(var5) ?? 0
	
let sumNumber_1 = number1 + number2 + number3 + number4 + number5
print("\(number1) + \(number2) + \(number3) + \(number4) + \(number5) = \(sumNumber_1)\n")


//string
var str1 = (Int(var1) != nil) ? var1 : "nil"
var str2 = (Int(var2) != nil) ? var2 : "nil"
var str3 = (Int(var3) != nil) ? var3 : "nil"
var str4 = (Int(var4) != nil) ? var4 : "nil"
var str5 = (Int(var5) != nil) ? var5 : "nil"

let sumNumber_2 = str1 + "+" + str2 + "+" + str3 + "+" + str4 + "+" + str5 + "=" + "\(sumNumber_1)\n"
print(sumNumber_2)


// #2
print("Variant - 2")
let var_1 = "32"
let var_2 = "3df"
let var_3 = "21"
let var_4 = "13sd"
let var_5 = "7"

print("\(Int(var_1)!) + \(Int(var_2)) + \(Int(var_3)!) + \(Int(var_4)) + \(Int(var_5)!) = \(sum_Numbers)\n")

var number_1 = Int(var_1) ?? 0
var number_2 = Int(var_2) ?? 0
var number_3 = Int(var_3) ?? 0
var number_4 = Int(var_4) ?? 0
var number_5 = Int(var_5) ?? 0

var sum_Numbers = number_1 + number_2 + number_3 + number_4 + number_5

print("\(number_1) + \(number_2) + \(number_3) + \(number_4) + \(number_5) = \(sum_Numbers)\n")


print("TASK-2")
//2. Поиграйтесь с юникодом и создайте строку из 5 самых классных по вашему мнению символов, можно использовать составные символы. Посчитайте длину строки методом SWIFT и Obj-C
let loveStr = "\u{1F496} \u{058D} \u{301} \u{260E}  \u{0488}"

print("\(loveStr) in swift, has - \(loveStr.count)\nBut in C++ has \((loveStr as NSString).length)\n")

loveStr.count
(loveStr as NSString).length


print("TASK-3")
// 3. Создайте строку английский алфавит, все буквы малые от a до z задайте константу - один из символов этого алфавита. Используя цикл for определите под каким индексом в строке находится этот символ
let alphaBet = "abcdefghijklmnopqrstuvwxyz"
let myLetter : Character = "k"

for (index, value) in alphaBet.enumerated() {
    if value == myLetter {
        print("\(value) - находится в алфавите на: \(index+1) месте")
    }
}
