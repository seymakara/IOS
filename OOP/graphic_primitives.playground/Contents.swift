//: Playground - noun: a place where people can play

import UIKit

// Create a Point struct that has two properties called "X" & "Y" both of which are Doubles
struct Point {
    var X: Double
    var Y: Double
}

// Create a Line struct that has a "Start" and "End" property both of type Point

struct Line {
    var Start : Point
    var End : Point
    func length() -> Double{
        let length: Double = sqrt((Start.X-End.X)*(Start.X-End.X)+(Start.Y-End.Y)*(Start.Y-End.Y)) //distance formula
        print(length)
        print(Start.Y)
        print(End.Y)
        return length
    }
}
var Line1: Line = Line(Start: Point(X: 5, Y: 1), End: Point(X: -5, Y: -1))
print(Line1.length())

//ANLAMADIM
//struct Triangle {
//    var points = [Point]()
//}
//var mytri = Triangle(points: [Point(X: 0, Y: 0), Point(X: 3, Y: 5), Point(X: 5, Y:3)])
//print(mytri)

