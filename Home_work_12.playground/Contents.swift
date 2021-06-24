//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
//
//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
//
//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
//
//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
//
//5. Следите чтобы ваш код был красивым!



//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур



print("TASK-1")
//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
enum Chessmen {
    
    case Figure (FiguresName, FigureColors, AlphaPosition, NumberPosition)
    
    enum FiguresName : String {
        case King     = "♔♚"
        case Queen    = "♕♛"
        case Rook     = "♖♜"
        case Bishop   = "♗♝"
        case Knight   = "♘♞"
        case Pawn     = "♙♟"
    }
    
    enum FigureColors : Int {
        case F_white = 0
        case F_black = 1
    }
    
    enum BoardColors : String {
        case White = "◼︎"
        case Black = "☐"
    }
    
    enum AlphaPosition : Character {
        case A = "A"
        case B = "B"
        case C = "C"
        case D = "D"
        case E = "E"
        case F = "F"
        case G = "G"
        case H = "H"
    }
    
    enum NumberPosition : Int {
        case N1 = 1
        case N2 = 2
        case N3 = 3
        case N4 = 4
        case N5 = 5
        case N6 = 6
        case N7 = 7
        case N8 = 8
    }
}

// фигуры с расположением, мат королю
var player_1_King      = Chessmen.Figure(.King, .F_black, .D, .N8)
var player_2_Queen_1   = Chessmen.Figure(.Queen, .F_white, .G, .N8)
var player_2_Queen_2   = Chessmen.Figure(.Queen, .F_white, .H, .N1)

// массив всех фигур
let arrChessFigure = [player_1_King, player_2_Queen_1, player_2_Queen_2]

print("\nTASK-2")
//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

for each in arrChessFigure {
    
    switch each {
    case let .Figure(name, color, aPos, nPos):
        if color.rawValue == 0 {
            let figure = name.rawValue.first!
            
            print("\(figure) - \(aPos.rawValue)\(nPos.rawValue)")
        } else {
            let figure = name.rawValue.last!
            
            print("\(figure) - \(aPos.rawValue)\(nPos.rawValue)")
        }
    }
}



print("\nTASK-3")
//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)

// функция обрабатывающая массив из фигур, и выводит всё
func gMeDicFig(arr: [Chessmen]) {
            
        var dicChessFig = [String: String]()    // Dictionary [String:String] -> ["A1":"♕"]
        
        for each in arr {                       // проходимся по массиву для записи в Dictionary
            
            switch each {
            case let .Figure(name, color, aPos, nPos) where color.rawValue == 0:    // если белый - то 0 (0ый элемент при создании)
                dicChessFig[String(aPos.rawValue) + String(nPos.rawValue)] = String(name.rawValue.first!)
            case let .Figure(name, color, aPos, nPos) where color.rawValue == 1:    // если чёрный - то 1 (1ый элемент при создании)
                dicChessFig[String(aPos.rawValue) + String(nPos.rawValue)] = String(name.rawValue.last!)
            default:
                break
            }
        }

    let strChess = "ABCDEFGH"               // переменная для того чтобы создать базу поля шахмат
    var dicChessBoard = [String:String]()   // словарь всех ходов + рисовка поля !!

    // цикл для заполнения всех ключей и значения поля, без фигур
    for (index, alphaBoard) in strChess.enumerated() {
        
        switch index {                      // switch сделал для того, чтобы добавить обработку фигур и замены value в dictionary
        case index where index % 2 == 0:    // условия для заполнения поля
            for numberBoard in 1...8 {
                
                if numberBoard % 2 == 0 {
                    dicChessBoard[String(alphaBoard) + String(numberBoard)] = "☐"
                } else {
                    dicChessBoard[String(alphaBoard) + String(numberBoard)] = "◼︎"
                }
            }
        default:                            // условия для заполнения поля
            for numberBoard in 1...8 {

                if numberBoard % 2 == 0 {
                    dicChessBoard[String(alphaBoard) + String(numberBoard)] = "◼︎"
                } else {
                    dicChessBoard[String(alphaBoard) + String(numberBoard)] = "☐"
                }
            }
        }
    }
    
    // цикл замены значения на фигуры, вместо поля
    for (key, value) in dicChessFig {
        
        for (key2, _) in dicChessBoard {
            
            if key == key2 {
                dicChessBoard[key2] = value
            }
        }
    }

    // условия вывода поля
    var strBoard = ""                       // переменная, которая выводит поле
    for each in dicChessBoard.keys.sorted() {

        for (key, value) in dicChessBoard {
            
            switch key {                    // можно было просто через if сделать, но предпочёл switch на всякий случай
            case key where key == each:     // условия добавления value в strBoard
                strBoard += value
                
                if strBoard.count == 8 {    // условия печати поля, поэтапно
                    print(strBoard)
                    strBoard = ""           // сбравсываем strBoard, для печати следующего слоя
                }
            default:
                break
            }
        }
    }
}

gMeDicFig(arr: arrChessFigure)



//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
//
//5. Следите чтобы ваш код был красивым!




/*
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

// Создаем условия победителя player figures (Winner)
let pF1 = Chessmen.King(.King, .F_white, .AplhaG, .Number_3)
let pF2 = Chessmen.Queen(.Queen, .F_white, .AplhaG, .Number_2)

// Создаем условия проигравшего figures (Loosers)
let lF1 = Chessmen.King(.King, .F_black, .AplhaG, .Number_1)

// Создали массив, со всеми фигурами на поле (без поля, позже нужно будет создать поле и наложить на него фигуры) arr with all figures
let allFigures = [pF1, pF2, lF1]


//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

// Сначала написал, как должно распечатываться, а потом все адаптировал под функцию
//for value in figureArray {
//    switch value {
//    case let .King(fName, fColor, fPosition, fNumber):
//        print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
//    case let .Queen(fName, fColor, fPosition, fNumber):
//        print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
//    case let .Rook(fName, fColor, fPosition, fNumber):
//        print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
//    case let .Elephant(fName, fColor, fPosition, fNumber):
//        print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
//    case let .Horse(fName, fColor, fPosition, fNumber):
//        print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
//    case let .Pawn(fName, fColor, fPosition, fNumber):
//        print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
//    }
//}
func printArray(take_array: [Chessmen]) {
    
    for value in take_array {
        switch value {
            
        case let .King(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
        case let .Queen(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
        case let .Rook(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
        case let .Elephant(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
        case let .Horse(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
        case let .Pawn(fName, fColor, fPosition, fNumber):
            print("\(fName.rawValue) - \(fColor.rawValue) - \(fPosition.rawValue)\(fNumber.rawValue)")
        }
    }
}

printArray(take_array: allFigures)


//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
// Создаем чистое поле шахмат
let numberBoard = [1,2,3,4,5,6,7,8]
let abcBoard = ["A", "B", "C", "D", "E", "F", "G", "H"]

var chessBoard = [String]()

for value in numberBoard {
    for (index,value_2) in abcBoard.enumerated() {
        var index2 = index
        index2 += 1
        
        if value % 2 == index2 % 2 {
            chessBoard.append(value_2)
            chessBoard.append(String(value))
            chessBoard.append("⬛️")
        } else {
            chessBoard.append(value_2)
            chessBoard.append(String(value))
            chessBoard.append("◻️")
        }
    }
}
//chessBoard
var strChessBoard = String()

for value in chessBoard {
    strChessBoard += value
}

// Выводим поле на экран
var strForCreatePrint = ""
var index = 0
var strForPrintBoard = ""

for value in strChessBoard {
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
        case "♕":
            strForPrintBoard += String("♕")
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


// Создаем строку, в которой фигуры вместе с полем
var strWithFigures = ""
func printArray2(take_array: [Chessmen]) {
    
    for value in take_array {
        switch value {
            
        case let .King(_, fColor, fPosition, fNumber):
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"

            if fColor.rawValue == "White" {
                strWithFigures += "♕"
            } else {
                strWithFigures += "♛"
            }

        case let .Queen(_, fColor, fPosition, fNumber):
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♔"
            } else {
                strWithFigures += "♚"
            }

        case let .Rook(_, fColor, fPosition, fNumber):
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♖"
            } else {
                strWithFigures += "♜"
            }

        case let .Elephant(_, fColor, fPosition, fNumber):
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♗"
            } else {
                strWithFigures += "♝"
            }

        case let .Horse(_, fColor, fPosition, fNumber):
            strWithFigures += "\(fPosition.rawValue)"
            strWithFigures += "\(fNumber.rawValue)"
            
            if fColor.rawValue == "White" {
                strWithFigures += "♘"
            } else {
                strWithFigures += "♞"
            }

        case let .Pawn(_, fColor, fPosition, fNumber):
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

printArray2(take_array: allFigures)
strWithFigures
*/
