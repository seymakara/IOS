import UIKit
var type = "Rectangle"
var description = "A quadrilateral with four right angles"

var width = 5
var height = Int(10.5)

height = height+1
width = width+1
var area = width * height

// Note how you can "interpolate" variables into Strings using the following syntax
print("The shape is a \(type) or \(description) with an area of \(area)")
