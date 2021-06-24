let wallet = [100, 50, 20, 10, 5, 2, 1, 0.50, 0.20, 0.10, 0.05, 0.02, 0.01, 1, 1, 1, 5, 5, 5]

var sum = Double()

for value in wallet {
    sum += value
}

sum


// 2
func calculateMoney (chtoHochesh : [Double]) {

    var sum = Double()
    
    for value in wallet {
        sum += value
    }
    
    print("Sum = \(sum)")
}

calculateMoney(chtoHochesh: wallet)


// 3
func calculateMoney_2 (chtoHochesh : [Double]) -> Double {
    
    var sum = Double()
    
    for value in wallet {
        sum += value
    }
    
    return sum
}

let money = calculateMoney_2(chtoHochesh: wallet)


// 4
func calculateMoney_3 (chtoHochesh: [Double], type: Double ) -> Double {
    var sum = Double()

    for value in chtoHochesh {
        
        if value == type {
            sum += value
        }
    }
    
    return sum
}

let money_2 = calculateMoney_3(chtoHochesh: wallet, type: 1)

let money_3 = calculateMoney_3(chtoHochesh: wallet, type: 5)


// 5
func calculateMoney_4 (chtoHochesh: [Double], type: Double ) -> (total : Double, count : Double) {
    var sum = Double()
    var count = Double()
    
    for value in chtoHochesh {
        
        if value == type {
            sum += value
            count += 1
        }
    }
    
    return (sum, count)
}

let money_4 = calculateMoney_4(chtoHochesh: wallet, type: 5)

money_4.total
money_4.count

// tuples
let (moneyz, count) = calculateMoney_4(chtoHochesh: wallet, type: 100)
moneyz
count


// 6
func calculateMoney_5 (chtoHochesh: [Double], type: Double? = nil ) -> (total : Double, count : Int) {
    var sum = Double()
    var count = Int()
    
    for value in chtoHochesh {
        
        if (type == nil) || (value == type!) {
            sum += value
            count += 1
        }
    }
    
    return (sum, count)
}

// tuples
//let (moneyzs, countz) = calculateMoney_5(chtoHochesh: wallet, type: nil)
let (moneyzs, countz) = calculateMoney_5(chtoHochesh: wallet, type: 100)
moneyzs
countz


// 7
func calculateMoney_x (inSequence range: Double...) -> Double {
    
    var sum : Double = 0
    for value in range {
        sum += value
    }
    
    return sum
}

calculateMoney_x(inSequence: 5,5,56,55,423,12)


// 8
func sayHi() {
    print("Hi")
}
sayHi()
let hi = sayHi()
hi

let hi_2 : () -> () = sayHi


// 9
func sayPhrase (phrase: String) -> Int? {
    print(phrase)
    
    return nil
}

sayPhrase(phrase: "Hello")

let phrase = sayPhrase
phrase("Hello World")


// 10
func whatCanIdo (whatToDo: () ) -> () {
    whatToDo
}


