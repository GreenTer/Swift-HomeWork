let array = ["a", "b", "c"]
array[0]
array[1]
array[2]


struct Family {
    var father  = "Father"
    var mother  = "Mother"
    var kids    = ["Kid_1", "Kid_2", "Kid_3"]
    
    // count person in family
    var count : Int {
        return 2 + kids.count
    }

    // subscript for find persone by index
    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2 + kids.count): return kids[index - 2]
            default: return nil
            }
        }
        set {
            let value = newValue ?? ""
            
            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): return kids[index - 2] = value
            default: break
            }
        }
    }
    
    // subscript for add suffix for persone
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        
        return name
    }
}

var family = Family()

// family code
family.father
family.mother
family.kids
family.count

// subscript
family[0]
family[1]
family[2]

// поменяли название папы
family[0] = "Daddy"
family.father

// поменяли имя первому рнебенку
family[2] = "Buddy"

// узнали имя первого ребенка, через массив детей
family.kids[0]


// проверяем сабскрипт с суффиксом
family[2]

// такое стало возможным, благодаря сабскрипту, который к имени добавляет суффикс
family[2, "the great"]!





// other Example
struct Field {
    
    // создали
    var dict = [String: String]()
    
    func keyForColomn(colomn: String, andRow row: Int) -> String {
        return colomn + String(row)
    }
    
    subscript(colomn: String, row: Int) -> String? {
        get {
            return dict[keyForColomn(colomn: colomn, andRow: row)]
        }
        set {
            dict[keyForColomn(colomn: colomn, andRow: row)] = newValue
        }
    }
}

var field = Field()
field["a", 5]
field["a", 5] = "X"
field["a", 5]
