import UIKit
//var toDoList: [String] = [String]()
//toDoList.append("Learn IOS")
//toDoList.append("Build the next Flappy Bird")
//toDoList.append("Retire in Cancun")
//print(toDoList)

//var toDoList = [String]()
//toDoList.append("Learn IOS")
//toDoList.append("Build the next Flappy Bird")
//toDoList.append("Retire in Cancun")
//print(toDoList)
//
//print("\(toDoList[0])")
//print("\(toDoList[0..<2])")
//
//var popped = toDoList.remove(at: 0)
//print(popped)
//print (toDoList)
//
//toDoList.insert("Never come back", at: 2)
//print(toDoList)
//
//toDoList.insert("Learn IOS", at: 0)
//print(toDoList)
//
//toDoList.insert("Live happily ever after", at: toDoList.count)
//print(toDoList)
//
//for item in toDoList{
//    print(item)
//}
//
//for i in 0..<toDoList.count{
//    print(toDoList[i])
//}

                    //DICTIONARIES

//var myDict2: [String: Int]
//var myDict2 = [String: Int]()

//var dictionary = [
//    "Kobe": 24,
//    "Lebron": 23,
//    "Rondo": 9
//]
//
//print(dictionary)
//
//
//print(dictionary["Kobe"]) //Optional(24) This prints optional. Optional is not unwrapped
//
//print(dictionary["Kobe"]!) // ! unwraps it.
//
//if let jerseyNumber = dictionary["Kobe"] {
//    print(jerseyNumber)
//}
//
//dictionary["Fisher"] = 2
//print(dictionary)
//
//dictionary["Kobe"] = 15
//print(dictionary)
//
//dictionary["Lebron"] = nil
//print(dictionary)
//
//var poor = dictionary.removeValue(forKey: "Rondo")
//print(poor)
//
//if let poor  = dictionary.removeValue(forKey: "Fisher"){
//    print(poor)
//}
//
//print(dictionary)
//dictionary["Fisher"] = 2
//dictionary["Lebron"] = 23
//dictionary["Rondo"] = 9
//
//print(dictionary)
//
//for (key, value) in dictionary{
//    print("The key is \(key) and the value  is \(value)")
//}
//
//for x in dictionary {
//    print(x)
//
//}
//
//func sayHello(name:String) {
//    print("Hello, \(name), how are you doing today?")
//}
//
//sayHello(name: "Andrew")

func lookForSomethingIn(dictionary: [String: Int], forKey key: String) -> Int? {
    if let value = dictionary[key] {
        return value
    } else {
        return nil
    }
}
var jerseyNumbers = ["Kobe": 24, "Curry": 30]
var jerseyNumber = lookForSomethingIn(dictionary: jerseyNumbers, forKey: "Kobe")

//if let num = jerseyNumber { // to unwrap it. result is just 24
//    print(num)
//}

print(jerseyNumber)

var present: String! = "Apple Watch"         // We don't have to unwrap to use the value,
print(present)


