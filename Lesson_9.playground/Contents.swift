/*
 for _ in 0...30 {

    for i in 0..<20 {

        if i == 10 {
            break
        }
        print(i)
    }
 }
 
 mainLoop: for _ in 0...30 {

        for i in 0..<20 {
 
        if i == 10 {
            break mainLoop
        }
        print(i)
    }
 }
 
 mainLoop: for _ in 0...30 {
 
 
 
 for i in 0..<20 {
     if i == 10 {
     break mainLoop
     }
     print(i)
     }
     }
 
 */

var age = 65
var name = "Alex"

switch age {
case 0...16:
    print("School")
case 17...21:
    print("Colleage")
case 22...55:
    print("Work")
case 56...60:
    break
case 61, 63, 66 :
    print("Yahooo ")
default:
    break
}

// 2
switch name {
case "Alex" where age < 50:
    print("Hi buddy!")
case "Alex" where age >= 50:
    print("I don't know you")

default:
    break
}


// 3 optional banding
var optional : Int? = 5

if let optional = optional {
    print("\(optional) != nil")
}


// 4
let tuple = (name, age)

switch tuple {
case ("Alex", 60):
    print("Hi Alex 60")
case ("Alex", 27):
    print("Hi Alex 27")
    
// value banding
    
case (_, let number) where number >= 65 && number <= 70:
    print("Hi old man!")
case ("Alex", _):
    print("Hi Alex!")
    
default:
    break
}


// 5
let point = (5,-6)

switch point {
case let (x,y) where x == y :
    print("x == y")
case let (x,y) where x == -y :
    print("x == -y")
case let (_,y) where y < 0 :
    print("y < 0")
default:
    break
}

// 6
let array : [CustomStringConvertible] = [5, 5.4, Float(5.4), "Sasha"]

switch array[3] {
//case let a as Int:
//    print("Int")
case _ as Int:
    print("Int")
case _ as Double:
    print("Double")
case _ as Float:
    print("Float")
case _ as String:
    print("String")
default:
    break
}
