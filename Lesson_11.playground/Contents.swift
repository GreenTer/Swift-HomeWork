//1
let numbers = [1 ,2 ,3, 1, 12, 13, 12, 33, 24, 12]

func filterArray(array: [Int], f: (Int) -> Bool) -> [Int] {
    
    var filtered = [Int]()
    
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}

func compare(i: Int) -> Bool {
    return i % 2 == 1
}

func compare_2(i: Int) -> Bool {
    return i % 2 == 0
}

//filterArray(array: numbers, f: <#T##(Int) -> Bool#>)
filterArray(array: numbers, f: compare)
filterArray(array: numbers, f: compare_2)


// 2
//filterArray(array: numbers, f: <#T##(Int) -> Bool#>)
filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 1
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 2 == 0
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i % 3 == 0
})

filterArray(array: numbers, f: {(i: Int) -> Bool in
    return i < 10
})


// 3
filterArray(array: numbers, f: {i in
    return i % 2 == 1
})

filterArray(array: numbers, f: {i in
    return i % 2 == 0
})


// 4
filterArray(array: numbers, f: { i in i % 2 == 1 })
filterArray(array: numbers, f: { i in i % 2 == 0 })


// 5 Short hand
let arr_1 = filterArray(array: numbers, f: { $0 % 2 == 1 })
arr_1

let arr_2 = filterArray(array: numbers, f: { $0 % 2 == 0 })
arr_2


// 6 Conspect!! Если условие идет самым последним, то скобки можно не ставить!
let arr_3 = filterArray(array: numbers) { $0 % 2 == 0 }
arr_3


// 7
let array = [1,2,3]
var count = 0


let b =
    filterArray(array: numbers) { value in
        
        for include in array {
            count += 1
            if include == value {
                return true
            }
        }
        return false
    }

b
count


// 8
var dict = [Int:Bool]()
for value in array {
    count += 1
    dict[value] = true
}

count
count = 0

let b_2 =

    filterArray(array: numbers) { value in
        count += 1
        return dict[value] != nil
    }

b_2
count
dict
