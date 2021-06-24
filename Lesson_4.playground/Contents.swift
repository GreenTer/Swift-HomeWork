var apples : Int? = 5

if var number = apples {
    number = number + 2
} else {
    print("nil apples")
}

//
let age = "60"

if Int(age) != nil {
    print("Htllo")
}

if let ageNumber = Int(age) {
    print(ageNumber)
}

/*
 if let ageNumber = age.toInt() {
 ageNumber
 }
*/

let possibleNumber = "hello"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print(convertedNumber)
} else {
    print("Nil")
}
