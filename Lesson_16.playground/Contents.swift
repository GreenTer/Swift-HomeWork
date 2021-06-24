// 1
//struct Point {
//    var x : Int
//    var y : Int
//}
//
//func move(point: Point, byX x: Int, andY y: Int) -> Point {
//    var point_2 = point
//    point_2.x += x
//    point_2.y += y
//    return point_2
//}
//
//var p = Point(x: 1, y: 1)
//
//p = move(point: p, byX: 2, andY: 4)
//p.x
//p.y


// 2
//struct Point {
//    var x : Int
//    var y : Int
//
//    mutating func move(byX x: Int, andY y: Int) { // mutating меняет саму property!
//        self.x += x
//        self.y += y
//    }
//
//}
//
//var p = Point(x: 1, y: 1)
//p.move(byX: 2, andY: 3)
//p.x
//p.y
//
//var p_2 = Point(x: 2, y: 2)


// 3
struct Point {
    var x : Int
    var y : Int
    
//    mutating func move(byX x: Int, andY y: Int) { // mutating меняет саму property!
//        self.x += x
//        self.y += y
//    }

    mutating func move(byX x: Int, andY y: Int) { // mutating меняет саму property! (only for var)
        self = Point(x: self.x + x, y: self.y + y)
    }
}

var p = Point(x: 1, y: 1)
p.move(byX: 2, andY: 3)
p.x
p.y

var p_2 = Point(x: 2, y: 2)


enum Color {
    static func numberOfElements() -> Int {
        return 2
    }
    
    case White
    case Black
    
    mutating func invert() -> Color {
        if self == Color.White {
            self = .Black
        } else {
            self = .White
        }
        return self
        //self = self == White ? Black : White
    }
    
    func printColor() {
        if self == Color.White {
            print("White")
        } else {
            print("Black")
        }
    }
}

var c = Color.White
c.printColor()
c.invert().printColor() // так стало возможно благодаря mutating func -> Color.. return self
Color.numberOfElements()
