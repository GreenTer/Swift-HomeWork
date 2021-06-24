// енумы для создания фигур, расположения, цвет и т.д.
enum Chessmen {
    enum FiguresName : String {
        case King     = "King"
        case Queen    = "Queen"
        case Rook     = "Rook"
        case Elephant = "Elephant"
        case Horse    = "Horse"
        case Pawn     = "Pawn"
    }
    
    enum FigureColors : String {
        case F_white = "White"
        case F_black = "Black"
    }
    
    enum BoardColors : String {
        case White = "White"
        case Black = "Black"
    }
    
    enum AlphaPosition : Character {
        
        case AplhaA = "A"
        case AplhaB = "B"
        case AplhaC = "C"
        case AplhaD = "D"
        case AplhaE = "E"
        case AplhaF = "F"
        case AplhaG = "G"
        case AplhaH = "H"
    }
    
    enum NumberPosition : Int {
        case Number_1 = 1
        case Number_2 = 2
        case Number_3 = 3
        case Number_4 = 4
        case Number_5 = 5
        case Number_6 = 6
        case Number_7 = 7
        case Number_8 = 8
    }
    
    case Pawn       (FiguresName, FigureColors, AlphaPosition, NumberPosition)
    case Horse      (FiguresName, FigureColors, AlphaPosition, NumberPosition)
    case Elephant   (FiguresName, FigureColors, AlphaPosition, NumberPosition)
    case Rook       (FiguresName, FigureColors, AlphaPosition, NumberPosition)
    case Queen      (FiguresName, FigureColors, AlphaPosition, NumberPosition)
    case King       (FiguresName, FigureColors, AlphaPosition, NumberPosition)
}

// функция, которая выводит все фигуры (+ создает строку с ними, это нам понадобится для замены с полем и выводом всего)
var strWithFigures = ""

func printArray(take_array: [Chessmen]) {
    
    for value in take_array {
        switch value {
            
        case let .King(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
            
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♕"
            } else {
                strWithFigures += "♛"
            }
            
        case let .Queen(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
            
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♔"
            } else {
                strWithFigures += "♚"
            }
            
        case let .Rook(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
            
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♖"
            } else {
                strWithFigures += "♜"
            }
            
        case let .Elephant(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
            
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♗"
            } else {
                strWithFigures += "♝"
            }
            
        case let .Horse(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
            
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♘"
            } else {
                strWithFigures += "♞"
            }
            
        case let .Pawn(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
            
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♙"
            } else {
                strWithFigures += "♟"
            }
        }
    }
}

// функция для заполнения переменной чистым полем
var chessBoardClear = String()
func ClearBoard(give_me_string: String){
    let numberBoard = [1,2,3,4,5,6,7,8]
    let abcBoard = ["A", "B", "C", "D", "E", "F", "G", "H"]
    
    for value in numberBoard {
        for (index,value_2) in abcBoard.enumerated() {
            var index2 = index
            index2 += 1
            
            if value % 2 == index2 % 2 {
                chessBoardClear.append(value_2)
                chessBoardClear.append(String(value))
                chessBoardClear.append("⬛️")
            } else {
                chessBoardClear.append(value_2)
                chessBoardClear.append(String(value))
                chessBoardClear.append("◻️")
            }
        }
    }
}

// функция для вывода поля на экран!
func BoardPrint(give_me_string: String){
    var strForCreatePrint = ""
    var index = 0
    var strForPrintBoard = ""
    
    // вывод самого поля на экран с фигурами
    for value in give_me_string {
        index += 1
        strForCreatePrint += String(value)
        
        if index == 3 {
            switch strForCreatePrint.last {
            case "⬛️","◻️":
                strForPrintBoard += String(value)
                if strForPrintBoard.count == 8 {
                    print(strForPrintBoard)
                    strForPrintBoard = ""
                }
            // сюда дописать условия замены ч/б на фигуры
            case "♕","♛","♙","♟","♔","♚","♖","♜","♗","♝","♘","♞":
                strForPrintBoard += String(value)
                if strForPrintBoard.count == 8 {
                    print(strForPrintBoard)
                    strForPrintBoard = ""
                }
            default:
                break
            }
            strForCreatePrint = ""
            index = 0
        }
    }
}


// Создаем условия победителя player figures (Winner)
let pF1 = Chessmen.King(.King, .F_white, .AplhaG, .Number_3)
let pF2 = Chessmen.Queen(.Queen, .F_white, .AplhaG, .Number_2)

// Создаем условия проигравшего figures (Loosers)
let lF1 = Chessmen.King(.King, .F_black, .AplhaG, .Number_1)

// Создали массив, со всеми фигурами на поле (без поля, позже нужно будет создать поле и наложить на него фигуры) arr with all figures
let allFigures = [pF1, pF2, lF1]

// распечатываем все фигуры, всех игроков
printArray(take_array: allFigures)

// распечатываем фигуры, для сравнения со строкой фигурного поля (strWithFigures)
print("Figures for win: \(strWithFigures)")

// создаем переменную в которой чистое поле, со всеми вариантами (chessBoardClear)
ClearBoard(give_me_string: chessBoardClear)

// распечатываем поле (чистое chessBoardClear)
BoardPrint(give_me_string: chessBoardClear)






// сравниваем (chessBoardClear и strWithFigures) и генерируем новую переменную (finalChessBoard)
print("Final Board")
// переводим все в массив (ключ - значение) 1. массив чистого поля, 2. массив фигур
func DoArrayKeyValue(give_me_string: String) -> [String:String] {
    var strArray = [String:String]()
    var key = [String]()
    
    for each in give_me_string {
        key.append(String(each))
        
        if key.count == 3 {
            strArray[key[0]+key[1]] = key[2]
            key.removeAll()
        }
    }
    return strArray
}

var arrayChessBoardClear = DoArrayKeyValue(give_me_string: chessBoardClear)
var arrayWithFigures     = DoArrayKeyValue(give_me_string: strWithFigures)

arrayChessBoardClear
arrayWithFigures

// создаем массив, который будет содержать поле с фигурами
var newChessBoardFinal = [String:String]()
for (key,value) in arrayChessBoardClear {
    newChessBoardFinal[key] = String(value)
    
    for (key2,value2) in arrayWithFigures {
        if key2 == key {
            newChessBoardFinal[key2] = String(value2)
        }
    }
}

arrayChessBoardClear
arrayWithFigures
newChessBoardFinal

// все остальные действия, перевод массива в строку для расспечатки поля! Т.к. функция распечатывает из переменной String!
var testArray = [String]()
for (key,value) in newChessBoardFinal {
    testArray.append(String(key)+String(value))
}

var strFinal = ""
for each in testArray.sorted() {
    strFinal += String(each)
}

BoardPrint(give_me_string: strFinal)
// распечатываем поле с расположением всех фигур на нем (finalChessBoard)
