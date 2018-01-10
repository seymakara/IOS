

import UIKit



var arr:[Int] = [Int]()
for i in 1...255{
    arr.append(i)
}

func swaprandom(arr: inout [Int]){
    for _ in 1...100{
        let random1 = Int(arc4random_uniform(UInt32(arr.count)))
        let random2 = Int(arc4random_uniform(UInt32(arr.count)))
        let temp = arr[random1]
        arr[random1] = arr[random2]
        arr[random2] = temp
    }
    var removed = Int()
//
    for j in 0..<arr.count-1{
        if arr[j] == 42{
            removed = j
            print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(removed)")
        }
    }
    arr.remove(at: removed)
    print(arr)
}
swaprandom(arr: &arr)


