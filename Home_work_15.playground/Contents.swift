//1. Создать структуру “Описание файла” содержащую свойства:
//- путь к файлу
//- имя файла
//- максимальный размер файла на диске
//- путь к папке, содержащей этот файл
//- тип файла (скрытый или нет)
//- содержимое файла (можно просто симулировать контент)
//Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии
//- минимально возможный рост и вес
//- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса


//1. Создать структуру “Описание файла” содержащую свойства:
//- путь к файлу
//- имя файла
//- максимальный размер файла на диске
//- путь к папке, содержащей этот файл
//- тип файла (скрытый или нет)
//- содержимое файла (можно просто симулировать контент)
let path = "/GreenTer/Documents/"
let content = "Lesson_15"

struct File {
    static var maxSize = 100.00
    //- имя файла
    var fileName : String
    //- путь к файлу
    var filePath : String
    //- тип файла (скрытый или нет)
    var isHidden : Bool
    //- максимальный размер файла на диске
    var fileSize : Double {
        didSet {
            if fileSize >= File.maxSize {
                fileSize = oldValue
            }
        }
    }
    //- путь к папке, содержащей этот файл
    var folderPath : String {
        get {
            if !isHidden {
                return filePath + fileName
            }
            return filePath
        }
    }
    //- содержимое файла (можно просто симулировать контент)
    var fileInfo : String {
        get {
            if !isHidden {
                return content
            }
            return "Is empty"
        }
    }
}

var file_1 = File(fileName: "file_1", filePath: path, isHidden: true, fileSize: 120)
var file_2 = File(fileName: "file_2", filePath: path, isHidden: false, fileSize: 55)
let file_3 = File(fileName: "file_3", filePath: path, isHidden: false, fileSize: 225)

let files = [file_1, file_2, file_3]

for file in files {
    print("Path: \(file.folderPath)")
    print("Content: \(file.fileInfo)")
}

file_3.fileSize


//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.
enum Colors : Int {
    case Green = 0x008000
    case Yellow = 0xffff00
    case Red = 0xff0000
    case Orange = 0xffa500
    
    static var totalColors = 4
    static let firstColor = Colors.Green.rawValue
    static let lastColor = Colors.Orange.rawValue
}

let greenColor = Colors.Green

greenColor.rawValue
Colors.firstColor
Colors.lastColor


//3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
//- минимальный и максимальный возраст каждого объекта
//- минимальную и максимальную длину имени и фамилии
//- минимально возможный рост и вес
//- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
var infoHumans = 0
class Human {
    var minLenght : Int {return 2}
    var maxLenght : Int {return 20}

    var minAge : Int {return 1}
    var maxAge : Int {return 100}
    
    var minHeight : Int {return 45}
    var maxHeight : Int {return 220}
    
    var minWeight : Int {return 2}
    var maxWeight : Int {return 150}
    
    var name : String {
        didSet {
            if name.count > maxLenght || name.count < minLenght {
                name = oldValue
            }
        }
    }
    
    var serName : String
    var age : Int
    var height : Int
    var weight : Int
    
    init(name: String, serName: String, age: Int, height: Int, weight: Int) {
        self.name = name
        self.serName = serName
        self.age = age
        self.height = height
        self.weight = weight
        
        infoHumans += 1
    }
}

let human_1 = Human.init(name: "Sasha", serName: "Borovitsky", age: 27, height: 189, weight: 80)
let human_2 = Human.init(name: "Valeriy", serName: "Kylak", age: 27, height: 179, weight: 68)
let human_3 = Human.init(name: "Lev", serName: "Borovitsky", age: 3, height: 89, weight: 14)
infoHumans
