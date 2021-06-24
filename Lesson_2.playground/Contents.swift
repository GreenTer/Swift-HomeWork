let numInt = 33
let numDouble : Double = 3.5
let numFloat : Float = 3.14

numInt

let rezInt = numInt + Int(numDouble) + Int(numFloat)
let rezDouble = Double(numInt) + numDouble + Double(numFloat)
// let rezFloat = numFloat + Float(numInt) + Float(numDouble)



// я тебя очень хочу прямо вот очень... прям вот жестко что бы ... до крика
	
12.123e2
0x5p2

/*
let a = 5
let b = 5.0
// не потеряли результат!! приводя к Int т.к. и - Double но после точки, нет цифер!
let c = a + Int(b)
*/

/*
let a = 5
let b = 5.2
// теряем результат!! приводя к Int, т.к. после точки ид]т значение > 0
//let c = a + Int(b)
let c = Double(a) + b
*/


// создал свой метод
typealias AlexNumber = Double
let a = 5
let b = 5.2
let c = AlexNumber(a) + b
