enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn(direction: Direction)
    
    enum Direction : String {
        case Left = "Left!"
        case Right = "Right!"
    }
}


var action = Action.Run(meters: 20, speed: 15)

//action = Action.Stop
action = .Stop
//action = .Walk(meters: 22)
//action = .Run(meters: 20, speed: 15)
//action = .Turn(direction: Action.Direction.Left)
action = .Turn(direction: .Left)

var direction = Action.Direction(rawValue: "Right!")!
action = .Turn(direction: direction)

switch action {
//case Action.Stop: print("Stop")
case .Stop:
    print("Stop")
//case .Walk(meters: let meters):
//case .Walk(let meters):
//    print("Walk \(meters) meters")
case .Walk(meters: let meters) where meters < 100:
    print("Short walk")
case .Walk(meters: _):
    print("Long walk")
case .Run(meters: let mm, speed: let ss):
    print("Run \(mm) meters with speed \(ss)")
case .Turn(direction: let dir) where dir == .Left:
    print("You are turn LEFT")
case .Turn(direction: let dir) where dir == .Right:
    print("You are turn RIGHT")
default: break
}

print(Action.Direction.Left.rawValue)
