//1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
//2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
//3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
//4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.



print("TASK-1")
//1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.
let strText    = "AUEIUOASDGHFHVSAGDVFKHJSGDGFHJSADHFJVBASDHJVFHGSADVGFYUBSYBFYSABFDJ"
let strGlasn   = "AEIOU"
let strSogl    = "BCDFGHJKLMNPQRSTVWXYZ"

var sumGlasn = 0     // сумма гласных
var sumSogl  = 0     // сумма согласных

var indexStrText = 0 // переменная для подсчёта результата

// #1 switch
for each in strText {

    for eachSogl in strSogl {                               // цикл для подсчёта согласных
        
        switch (each, eachSogl) {
//        case (each, eachSogl) where each == eachSogl :
        case (eachSogl, each):      // refactoring выше строчки!
            sumSogl += 1
        default:
            break
        }
        
    }
    
    for eachGlasn in strGlasn {                             // цикл для подсчёта гласных
        
        switch (each, eachGlasn) {
//        case (each, eachGlasn) where each == eachGlasn :
        case (eachGlasn, each):     // refactoring выше строчки!
            sumGlasn += 1
        default:
            break
        }
        
    }
    
    indexStrText += 1                                       // переменная для вывода результата
    
    if indexStrText == strText.count {                      // условия вывода результата
        print("Считаем гласные и согласные в строке:\n\(strText)\n\nВариант Switch #1")
        print("Сумма согласных: \(sumSogl)")
        print("Сумма гласных  : \(sumGlasn)")
    }
}

// #2 switch
sumGlasn = 0
sumSogl = 0
indexStrText = 0

for eachText in strText {

    switch eachText {
    case "A", "E", "I", "O", "U" :
        sumGlasn += 1
    case "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z" :
        sumSogl += 1
    default:
        break
    }
    
    indexStrText += 1
    
    if indexStrText == strText.count {
        print("\nВариант Switch #2")
        print("Сумма согласных: \(sumSogl)")
        print("Сумма гласных  : \(sumGlasn)")
    }

}



print("\nTASK-2")
//2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа
let agePerson = 29

print("Ваш возраст \(agePerson)")

switch agePerson {
case 0...16:
    print("")
    print("Вы являетесь - School boy")
case 17...21:
    print("Вы являетесь - Teenagers")
case 22...30:
    print("Вы являетесь - Boy")
case 31...50:
    print("Вы являетесь - Man")
case 51...95:
    print("Вы близки к Боровицкой Сони!! Так держать 💞")
default:
    print("Вы обманщик!")
    break
}



print("\nTASK-3")
//3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.
let tupleStudent = [(name: "Александр", surName: "Боровицкий", fullName: "Евгеньевич"), (name: "Лев", surName: "Боровицкий", fullName: "Александрович"), (name: "Дарья", surName: "Боровицкая", fullName: "Олеговна")]


for each in tupleStudent {
    
    switch each {
    case (let name,_,_) where name.hasPrefix("А"): // еще вот так вот можно!!
        print("Привет, \(each.name)")
//    case _ where each.name.hasPrefix("А"): 
//        print("Привет, \(each.name)")
    case _ where each.fullName.hasPrefix("А"):
        print("Привет, \(each.name) \(each.fullName)")
    case _ where each.fullName.hasPrefix("О"):
        print("Привет, \(each.name) \(each.fullName) \(each.surName)")
    default:
        break
    }
    
}


/*
let personName = ["lastName" : "Боровицкий", "name" : "Александр", "secondName" : "Евгеньевич"]

for bukva in personName["name"]! {
    switch bukva {
    case "А", "О" :
        print("Hello \(personName["name"]!)")
    default:
        break
    }
}

// 3.1
let persoName_2 = (lastName : "Боровицкий", name : "Александр", secondName : "Евгеньевич")

switch persoName_2 {
case _ where persoName_2.name.hasPrefix("А") || persoName_2.name.hasPrefix("О"):
    print("Hello, \(persoName_2.name)")
case _ where persoName_2.secondName.hasPrefix("В") || persoName_2.secondName.hasPrefix("Д"):
    print("Helo, \(persoName_2.name) \(persoName_2.secondName)")
case _ where persoName_2.lastName.hasPrefix("Е") || persoName_2.lastName.hasPrefix("З"):
    print("Helo, \(persoName_2.lastName)")
default:
    break
}
// 3.2
print("Задание через массив (Большой код!\n)")
let arrTupleStudent = [(name: "Александр", surName: "Боровицкий", fullName: "Евгеньевич"), (name: "Лев", surName: "Боровицкий", fullName: "Евгеньевич"), (name: "Дарья", surName: "Боровицкая", fullName: "Олеговна")]

var indexArrTuple = 0
for each in arrTupleStudent {

 if each.name.hasPrefix("А") || each.name.hasPrefix("Л") {
     print("Здравствуйте \(arrTupleStudent[indexArrTuple].name)")
 }
 indexArrTuple += 1
}

indexArrTuple = 0

for each in arrTupleStudent {

 for each in each.name {

     switch each {
     case "А":
         print("Здравствуйте студент - \(arrTupleStudent[indexArrTuple].name)")
     case "Л":
         print("Здравствуйте студент - \(arrTupleStudent[indexArrTuple].name)")
     default:
         break
     }

 }

 for each in each.fullName {
     
     switch each {
     case "Е":
         print("Здравствуйте студент - \(arrTupleStudent[indexArrTuple].name) \(arrTupleStudent[indexArrTuple].fullName)")
     case "О":
         print("Здравствуйте студент - \(arrTupleStudent[indexArrTuple].name) \(arrTupleStudent[indexArrTuple].fullName)")
     default:
         break
     }
 }
 
 indexArrTuple += 1
}
*/


print("\nTASK-4")
// 4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил, убил.
let ship1 = [
    (x:3, y:1),
    (x:4, y:1),
    (x:5, y:1),
    (x:6, y:1)]

let ship2 = [
    (x:2, y:3),
    (x:2, y:4)]

// выстрелы игрока
let playerTurns = [
    (x:2, y:3),
    (x:2, y:7),
    (x:2, y:4),
    (x:8, y:3),
    (x:3, y:1),
    (x:4, y:1),
    (x:5, y:1),
    (x:6, y:1)]

// массив с короблями
let gameBoard = [ship1, ship2]


for ship in gameBoard {     // вывод самого коробля
    
    var shipDestroed = 0    // переменная отвечающая за убийство коробля
    var missShot = 0        // переменная отвечающая за промах коробля
    
    for shipPosition in ship {      // проходимся по всем точкам коробля
        
        for hit in playerTurns {    // проходимся по всем выстрелам игрока
            // сравниваем выстрел игрока с положением коробля
            switch (hit.x, hit.y) {
            case (shipPosition.x, shipPosition.y):
                print("Попал x: \(hit.x), y: \(hit.y)")
                // условия для подсчёта и проверки на убийство коробля
                shipDestroed += 1
                shipDestroed == ship.count ? print("Убил \(ship)") : nil
            default:
                // условие вывода и подсчёта промаха
                missShot == 0 ? print("\nПромах x: \(hit.x), y: \(hit.y)\n") : nil
                missShot += 1
                break
            }
        }
    }
}

/* Рабочий вариант, без рефакторинга кода!
// вывод самого коробля
for ship in gameBoard {

    // переменная отвечающая за убийство коробля
    var shipDestroed = 0
    // переменная отвечающая за промах коробля
    var missShot = 0

    // проходимся по всем точкам коробля
    for shipPosition in ship {

        // проходимся по всем выстрелам игрока
        for hit in playerTurns {

            // сравниваем выстрел игрока с положением коробля
            switch hit {
            case _ where shipPosition.x == hit.x && shipPosition.y == hit.y:
                print("Попал x: \(hit.x), y: \(hit.y)")
                
                shipDestroed += 1
                
                // условия для проверки на убийство коробля
                if shipDestroed == ship.count {
                    print("Убил \(ship)")
                }
                // условие вывода и подсчёта промаха
                case _ where shipPosition.x != hit.x && shipPosition.y != hit.y:
                    
                    if missShot == 0 {
                        print("\nПромах x: \(hit.x), y: \(hit.y)\n")
                        
                        missShot += 1
                    }
            default:
                break
            }
        }
    }
}
*/


