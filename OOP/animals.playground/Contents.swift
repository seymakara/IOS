//: Playground - noun: a place where people can play

import UIKit

class Animal {
    var name: String
    var health: Int = 100
    init(name:String){
        self.name = name
    }
    func displayHealth() {
        print("Health Level:\(self.health)")
    }
}

//var animal1 = Animal(name: "Dog")
//animal1.displayHealth()

class Cat: Animal {
    func growl(){
        print("Rawr!")
    }
    override init(name: String) {
        super.init(name: name)
        self.health = 150
    }
    func run() {
        print("Running")
        self.health -= 10
    }
}

//var animal2 = Cat(name: "Pakize")
//animal2.displayHealth()
//animal2.run()
//animal2.displayHealth()

class Cheetah: Cat {
    override func run() {
        if (self.health >= 50) {
            print("Running Fast")
            self.health -= 50
        }
    }
    func sleep() {
        if (self.health < 151) {
            self.health += 50
        } else {
            self.health = 200
        }
    }
}

//var cheetah = Cheetah(name: "cita")
//cheetah.run()
//cheetah.displayHealth()
//cheetah.sleep()
//cheetah.displayHealth()

class Lion: Cat {
    override func growl(){
        print("ROAR!!!! I am the King of the Jungle")
    }
    override init(name: String) {
        super.init(name: name)
        self.health = 200
    }
}
var lion = Lion(name:"aslan")
lion.displayHealth()
lion.run()
lion.displayHealth()
lion.growl()

