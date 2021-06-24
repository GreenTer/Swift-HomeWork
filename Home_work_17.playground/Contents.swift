//Шахматная доска (Легкий уровень)
//1. Создайте тип шахматная доска.
//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
//3. Если юзер ошибся координатами - выдавайте нил
//Крестики нолики (Средний уровень)
//1. Создать тип, представляющий собой поле для игры в крестики нолики
//На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
//Добавьте возможность красиво распечатывать поле
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
//причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
//4. Если хотите, добавте алгоритм, который вычислит победителя
//Морской бой (Тяжелый уровень)
//1. Создайте тип корабль, который будет представлять собой прямоугольник. В нем может быть внутренняя одномерная система координат (попахивает сабскриптом). Корабль должен принимать выстрелы по локальным координатам и вычислять когда он убит
//2. Создайте двумерное поле, на котором будут располагаться корабли врага. Стреляйте по полю и подбейте вражеский четырех трубник :)
//3. Сделайте для приличия пару выстрелов мимо, красивенько все выводите на экран :)


//Шахматная доска (Легкий уровень)
//1. Создайте тип шахматная доска.
//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
//3. Если юзер ошибся координатами - выдавайте нил

struct ChessField {
    var chessFieldDict = [String: String]()

    
    func keyForChessField(colomn: String, andRow row: Int) -> String {
        return colomn + String(row)
    }
    
    
    subscript(colomn: String, row: Int) -> String? {
        mutating get {
            switch(colomn) {
            case "A","C","E","G":
                chessFieldDict[keyForChessField(colomn: colomn, andRow: row)] = row % 2 == 1 ? "◼️" : "◽️"
                
            case "B","D","F","H":
                chessFieldDict[keyForChessField(colomn: colomn, andRow: row)] = row % 2 == 1 ? "◽️" : "◼️"
            default:
                return "nil"
            }
            
            return chessFieldDict[keyForChessField(colomn: colomn, andRow: row)]
        }
    }
}

var chessField = ChessField()
chessField["A", 1]
chessField["B", 1]
chessField["A", 2]
chessField["B", 2]
chessField["N", 2]
chessField.chessFieldDict


//Крестики нолики (Средний уровень)
//1. Создать тип, представляющий собой поле для игры в крестики нолики
//На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
//Добавьте возможность красиво распечатывать поле
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
//причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
//4. Если хотите, добавте алгоритм, который вычислит победителя

enum FieldPictures: String {
    case Field  = "⬜️"
    case Cross  = "❌"
    case Zero   = "⭕️"
}


struct FieldTicTacToe {
    // переменная, в которой хранятся все данные игры
    var ticTacToeArray = [String: String]()
    
    // функция создания поля
    mutating func createField() {
        
        for each in "ABC" {
            
            for each_2 in 1...3 {
                
                ticTacToeArray[String(each) + String(each_2)] = FieldPictures.Field.rawValue
            }
        }
        print(ticTacToeArray)
    }
    
    // функция вывода на экран поля игры со всеми картинками
    func printField() {
        var fieldString = ""
        
        for key in ticTacToeArray.keys.sorted() {
            
            fieldString += ticTacToeArray[key] ?? FieldPictures.Field.rawValue
            
            if fieldString.count == 3 {
                print(fieldString)
                fieldString = ""
            }
        }
    }
    
    
    subscript(Row row: String, andLine line: Int, andMark mark: FieldPictures) -> String {
        mutating get {
            let newMark = row + String(line)
            
            ticTacToeArray[newMark] = mark.rawValue
            printField()
            print("------------")
            return ""
        }
    }
}

var game = FieldTicTacToe()
game.createField()
//game.ticTacToeArray
//game.printField()
//game.ticTacToeArray["A1"] = FieldPictures.Cross.rawValue
//game.ticTacToeArray["A3"] = FieldPictures.Cross.rawValue
//game.printField()

game[Row: "A", andLine: 2, andMark: .Cross]
game[Row: "B", andLine: 2, andMark: .Zero]

game[Row: "A", andLine: 1, andMark: .Cross]
game[Row: "A", andLine: 3, andMark: .Zero]

game[Row: "B", andLine: 1, andMark: .Cross]
game[Row: "C", andLine: 1, andMark: .Zero]

// P.S. не стал делать проверку и выигрыш! Пошел дальше учиться
