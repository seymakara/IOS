//: Playground - noun: a place where people can play

import UIKit


func tossacoin() -> String {

    let coin = Int(arc4random_uniform(UInt32(2)))
    
    if coin == 0 {
        return "Heads"
    }
    else {
        return "Tails"
    }
    
}


func tossMultipleCoins(num : Int) -> Double{
    var countheads = 0
    var counttails = 0
    for _ in 1...num{
        if tossacoin() == "Heads"{
            countheads = countheads+1
        }
        else{
            counttails = counttails+1
        }
    }
    return Double(countheads) / Double(num)
}
tossMultipleCoins(num: 50)
