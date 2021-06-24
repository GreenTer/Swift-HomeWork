var dict_1 = ["car" : "porshe", "name" : "Sasha", "male" : "man"]

dict_1["car"]
dict_1.count
dict_1.isEmpty

dict_1["name"]
dict_1

dict_1.keys
dict_1.values

dict_1["comp"] = "mac"
dict_1

dict_1.updateValue("dollars", forKey: "money")
dict_1

dict_1["car"] = nil
dict_1

dict_1.removeValue(forKey: "name")
dict_1

dict_1 = [:]
dict_1

dict_1["hello"] = "world"
dict_1

dict_1["name"] = "Sasha"
dict_1["car"] = "porshe"
dict_1["hello"] = "world"
dict_1


for key in dict_1.keys {
    print("key = \(key), value = \(dict_1[key]!)")
}

for (key,value) in dict_1 {
    print("key = \(key), value = \(value)")
}
