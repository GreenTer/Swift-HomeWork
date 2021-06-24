// sum float + int + double

let a = 1
let b = 2.3
let c : Float = 1.7

//let sumI = a + Int(b) + Int(c)
let sumI = Int(Double(a) + Double(c) + b)
let sumF = Float(a) + Float(b) + c
let sumD = Double(a) + b + Double(c)


// a>b or a>c and t.c.
if Double(sumI) < sumD {
    print("Double (\(sumD)) is greater integer (\(sumI))!")
} else if Double(sumI) == sumD {
    print("Double (\(sumD)) is equial integer (\(sumI))!")
} else {
    print("Integer is greater")
}
