//1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
//Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"
//2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок).
//Используем полиморфизм
//3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
//- Создайте по пару объектов каждого класса.
//- Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
//- Сколько четвероногих?
//- Сколько здесь животных?
//- Сколько живых существ?


//1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
print("TASK-1")
class Artist {
    var name: String = ""
    var lastName: String = ""
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
    
    func showArtist() -> String {
        return "Artist name and serName: \(name) \(lastName)"
    }
}


class Dancer: Artist {
    
    override func showArtist() -> String {
        return super.showArtist() + " - I am dancing!"
    }
}


class Singer: Artist {
    
    override func showArtist() -> String {
        return super.showArtist() + " - I am singing!"
    }
}


class Painter: Artist {
    
    override var name: String {
        didSet {
            super.name = "Lev"
        }
    }
    
    override var lastName: String {
        didSet {
            super.lastName = "Borovitsky"
        }
    }
    
    override func showArtist() -> String {
        return super.showArtist() + " - I am painting!"
    }
}

var dancer = Dancer(name: "Grin", lastName: "Outstanding")
var singer = Singer(name: "Sergey", lastName: "Babkin")
var painter = Painter(name: "Vasua", lastName: "Pupkin")

let artistsArray = [dancer, singer, painter]

for each in artistsArray {
    print(each.showArtist())
}


//2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок).
//Используем полиморфизм
print("\nTASK-2")
class Vehicle {
    
    var nameVehicle: String = ""
    
    var speed: Int = 0
    var capacityPeople: Int = 0
    var theCostOfTravel: Int = 0
    
    init(nameVehicle: String, speedVehicle: Int, capacityPeople: Int, theCostOfTravel: Int) {
        self.nameVehicle = nameVehicle
        self.speed = speedVehicle
        self.capacityPeople = capacityPeople
        self.theCostOfTravel = theCostOfTravel
    }
    
    static var trip = 1000
    
    func travel() -> String {
//        let fullTrip = Vehicle.trip / theCostOfTravel
        
        return "Vehicle: \(nameVehicle) - Speed: \(speed) - Capacity: \(capacityPeople) - Cost from person: \(theCostOfTravel) - Full price from all people: \(capacityPeople * theCostOfTravel)$ - Travel time: \( Float(Vehicle.trip) / Float(speed) ) hour"
    }
}


class Aircraft: Vehicle {
}


class Boat: Vehicle {
}


class Car: Vehicle {
}


class Helicopter: Vehicle {
}


let aircraft = Aircraft(nameVehicle: "Aircraft", speedVehicle: 870, capacityPeople: 180, theCostOfTravel: 150)
let boat = Boat(nameVehicle: "Boat", speedVehicle: 40, capacityPeople: 1200, theCostOfTravel: 100)
let car = Car(nameVehicle: "Car", speedVehicle: 100, capacityPeople: 4, theCostOfTravel: 70)
let helicopter = Helicopter(nameVehicle: "Helicopter", speedVehicle: 340, capacityPeople: 4, theCostOfTravel: 250)

let vehicleArray = [aircraft, boat, car, helicopter]

for each in vehicleArray {
    print(each.travel())
}


//3. Есть 5 классов: люди, крокодилы, обезьяны, собаки, жирафы. (в этом задании вы будете создавать не дочерние классы, а родительские и ваша задача создать родительский таким образом, что бы группировать эти 5).
//- Создайте по пару объектов каждого класса.
//- Посчитайте присмыкающихся (создайте масив, поместите туда присмыкающихся и скажите сколько в нем объектов)
//- Сколько четвероногих?
//- Сколько здесь животных?
//- Сколько живых существ?
print("\nTASK-3")
class Live {
    var name: String = ""
    var legs: Int = 0
    var infoClass: String = ""
    
    init(name: String, legs: Int, infoClass: String) {
        self.infoClass = infoClass
        self.name = name
        self.legs = legs
    }
}


class Human: Live {
}


class Crocodile: Live {
}


class Monkey: Live {
}


class Dog: Live {
}


class Giraf: Live {
}


let human_1 = Human(name: "Sasha", legs: 2, infoClass: "Human")
let human_2 = Human(name: "Dasha", legs: 2, infoClass: "Human")
let monkey_1 = Monkey(name: "Dev", legs: 2, infoClass: "Animal")
let monkey_2 = Monkey(name: "Kev", legs: 2, infoClass: "Animal")
let crocodile_1 = Crocodile(name: "Miki", legs: 0, infoClass: "Animal")
let crocodile_2 = Crocodile(name: "Viki", legs: 0, infoClass: "Animal")

let reptiliesArray = [human_1, human_2, monkey_1, monkey_2, crocodile_1, crocodile_2]


var countLegs_0 = 0
var countLegs_2 = 0
var countLegs_4 = 0
var countHuman = 0
var countAnimal = 0
for each in reptiliesArray {
    
    switch each.legs {
    case 0:
        countLegs_0 += 1
    case 2:
        countLegs_2 += 1
    case 4:
        countLegs_4 += 1
    default:
        break
    }
    
    switch each.infoClass {
    case "Human":
        countHuman += 1
    case "Animal":
        countAnimal += 1
    default:
        break
    }
    
    if reptiliesArray.count == (countLegs_0 + countLegs_2 + countLegs_4) {
        print("Total reptilies: \(reptiliesArray.count) (People: \(countHuman) - Animals: \(countAnimal))")
    }
}
