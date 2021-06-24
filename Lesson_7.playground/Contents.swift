let constArray = ["a", "b", "c", "d"]
constArray.count
var array = [String]()

// 1
if array.count == 0 {
    print("Array is empty..")
}

// 2
if array.isEmpty {
    print("Array is empty..")
}

array += constArray
array
array += constArray
array

array += ["e"]
array
array.append("f")
array


// 3
var array_2 = array
array
array_2

array_2[0] = "1"
array_2
array

// 4
array[1...4]
array[1...4] = ["0"]
array
array.insert("-", at: 3)
array
array.remove(at: 3)
array

// 5
let money = [100, 1, 5, 20, 1, 50, 1, 1, 20, 1]
var sum = 0
for i in 0..<money.count {
    print("index = \(i), value = \(money[i])")
    sum += money[i]
}
sum


sum = 0
for i in money {
    print("i = \(i)")
    sum += i
}
sum


sum = 0
var index = 0
for value in money {
    print("index = \(index), value = \(value)")
    sum += value
    index += 1
}
sum

// 6
let shoppingList = ["Six eggs", "Flour", "Baking Powder", "Bananas"]
for item in shoppingList {
    print(item)
}


for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}
