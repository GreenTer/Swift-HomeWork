let MaxNameLenght = 15 // global var

class Human {
    
    var name: String {
        didSet {
            if name.count > MaxNameLenght {
                name = oldValue
            }
        }
    }
    
    lazy var storyOfMyLife = "This is a story of my entire life..." // lazy always var, переменная, которую не обязательно задействовать (иногда бывают условия когда надо)
    
//    static let maxAge = 100 // переменная, которая статична в классе(структуре) и ее ненадо запонять (должны быть дефолтные значения)
    class var maxAge: Int {
        return 100
    }
    
    var age: Int {
        didSet {
            if age > Human.maxAge {
                age = oldValue
            }
        }
    }
    
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let human = Human(name: "Peter", age: 40)
human.name = "aqsdfjsahdfuijhgsdj;kfhsd;jf"
human.name

struct Cat {
    
    var name: String
    
    static let maxAge = 20 // переменная, которая статична в классе(структуре) и ее ненадо запонять (должны быть дефолтные значения
    
    static var totalCats = 0
    
    var age: Int {
        didSet {
            if age > Cat.maxAge {
                age = oldValue
            }
        }
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        
        Cat.totalCats += 1
    }
}

var cat_1 = Cat(name: "Whiten", age: 10)
var cat_2 = Cat(name: "Afina", age: 11)
var cat_3 = Cat(name: "Silvana", age: 4)

Cat.totalCats // 3



enum Direction {

    static let enumDirection = "Directions in the game"

    case Left
    case Right
    case Top
    case Bottom
    
    var isVertical : Bool {
        return self == .Top || self == .Bottom
    }
    
    var isHorizontal : Bool {
        return !isVertical
    }
}

let player_1 = Direction.Right

player_1.isHorizontal
player_1.isVertical
Direction.enumDirection
