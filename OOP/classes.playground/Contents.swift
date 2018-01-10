//: Playground - noun: a place where people can play

import UIKit

//class Person {
//    var species = "H. Sapiens"
//    var name: String
//    init(name: String) {    // Note this function doesn't get called explicitly. It is called
//                            // when creating an instance using initialization syntax -- "Person()".
//        self.name = name    // Note use of "self" here to refer to the name property.
//    }
//    func speak() {
//        print("Hello! I am a \(self.species) and my name is \(self.name)")
//                            // Note how we refer to the properties using "self".
//    }
//}
//var myPerson: Person = Person(name: "Jay")   // Now we have to pass a param to Person initialization.
//myPerson.speak()                             // Note we call method similar to how we access properties.





//struct Rectangle {
//    var width: Int
//    var height: Int
//}
//var square1 = Rectangle(width: 10, height: 10)
//var square2 = square1                       // Here the val inside square 1 (an instance of Rectangle)
//                                            // is copied and passed rather than just pointed to.
//print("square1's width: \(square1.width), square2's width \(square2.width)") // They are the same because                                   square2 is a copy of square1
//square2.width = 20                            // This only changes square2 because there are
//// 2 separate instances of rectangle in memory
//square2.height = 20
//print("square1's width: \(square1.width), square2's width \(square2.width)")
//// They are different now: changing square2 changed a
//// completely separate instance from square1.





class Person {
    var species = "H. Sapiens"
    var name: String
    init(name: String) {         // Note: this function doesn't get called explicitly.  It is called
        // when creating an instance using the initialization syntax -- "Person()"
        self.name = name           // Note the use of "self" here to refer to the name property
    }
    func speak() {
        print("Hello! I am a \(self.species) and my name is \(self.name)")
        // Note how we refer to the properties using "self"
    }
}
class Developer: Person {      // Note how we are specifying that Developer will inherit from Person
    var favoriteLanguage: String
    init(name: String, favoriteLanguage: String) {
        self.favoriteLanguage = favoriteLanguage
        super.init(name: name)
    }
    override func speak() {
        print("Hello! I am a Developer! My name is \(self.name)")
    }
}
var myDeveloper: Developer = Developer(name: "Jay", favoriteLanguage: "Swift")
myDeveloper.speak()
