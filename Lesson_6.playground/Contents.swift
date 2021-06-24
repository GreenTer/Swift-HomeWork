//var str = String()
var str = "c"
str = str + "a"
str += "b"


/*
var a = 5
var b = a

a += 1
b
*/

var str1 = "a"
var str2 = str1

str1
str2

//str1 = "b"

str1
str2

str1.isEmpty

let char1 : Character = "x"

for c in "Hello world!" {
    print(c)
}

str1.append(char1) // string + string


//
let heart = "\u{1F496}"


var fun : Character = "ъ\u{301}\u{20dd}"


let funString = "What is this? -> \(fun)"

funString

//razobratsya, dolzen vivodit koli4estvo simvolov countElements(funString)


if funString == "aa" {
    
} else {
    print("not equal")
}

funString.hasPrefix("What")
funString.hasSuffix("What")
funString.hasSuffix("ъ\u{301}\u{20dd}")
funString.hasSuffix("ъ")
