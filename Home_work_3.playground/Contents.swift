// tuples Sasha and Lev
let tupleSasha  = (max_push_up:100, max_squats:80, max_pulling_up:20)
let tupleLev    = (max_push_up:80,  max_squats:100, max_pulling_up:15)

let (push_up, squats, pulling_up) = tupleSasha // variable to take params


// tuple print
print("Характеристики Саши\nОтжимания: \(tupleSasha.0)\nПриседания: \(squats)\nПодтягивания: \(tupleSasha.max_pulling_up)\n")


// tuple pomenyat mestami
var tupleLev_Sasha = (max_push_up:80, max_squats:100, max_pulling_up:20)
print("Tuple Sasha:\n\(tupleLev_Sasha)\n")

tupleLev_Sasha = tupleSasha
print("New tuple Lev = tuple Sasha:\n\(tupleLev_Sasha)\n")


// tuple raznica #1
if tupleSasha.0 > tupleLev.0 {
    print("Отжимания больше у Саши(\(tupleSasha.0)), чем у Льва(\(tupleLev.max_push_up))!")
} else {
    print("Отжимания больше у Льва(\(tupleLev.max_push_up)), чем у Саши(\(tupleSasha.0))!")
}

// tuple raznica #2
if tupleSasha.max_squats > tupleLev.max_squats {
    print("Приседаний больше у Саши(\(tupleSasha.max_squats)), чем у Льва(\(tupleLev.max_squats))!")
} else {
    print("Приседаний больше у Льва(\(tupleLev.1)), чем у Саши(\(tupleSasha.1))!")
} // i t.d. dlya kazdogo zna4eniya


// tuple raznica zapisat v noviy tuple
var tupleRaznica = (max_push_up:80, max_squats:100, max_pulling_up:20)
tupleRaznica.0 = tupleSasha.0 - tupleLev.0

print("\nРазница в подтягиваниях: \(tupleRaznica.0)\nТ.к. Лев подтягивается - \(tupleLev.0) раз, а Саша - \(tupleSasha.0)")
// i t.d
