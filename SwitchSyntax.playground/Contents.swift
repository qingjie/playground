//: Playground - noun: a place where people can play

import UIKit

var temp:Int = Int(arc4random()%100)+1

var temp1:Int = Int(arc4random_uniform(100))+1

/////////////////////////////////////////////////

struct BookInfo {
    var ID:Int = 0
    var Name:String = "Default"
    var Author:String = "Default"
    
}

var book1:BookInfo
var book2 = BookInfo( ID:0021, Name:"Name1", Author:"Author1" )
book2.ID = 1234

/////////////////////////////////////////////////

enum CompassPoint{
    case North
    case South
    case East
    case West
}

var directionTohead = CompassPoint.West

enum Planet:Int {
    case Mercury = 1
    case Venus = 2
    case Earth = 3
}

let earthOrder = Planet.Earth.rawValue
let possiblePlanet = Planet.Earth.hashValue


enum Direction {
    case Up
    case Down
    
    func description() -> String {
        switch (self) {
        case .Up:
            return "UP"
        case .Down:
            return "DOWN"
        //default: break
        }
    }
}

println(Direction.Up.description())


var fruit = "apple"

switch fruit {
    case "apple":
    println("good")
    fallthrough
    case "orange","banana":
    println("great")
    default:
    println("bad")
}


var age = 10

switch age {
case 0...4:
    println("0...4")
case 5...9:
    println("5...9")
case 10...14:
    println("10...14")
default:
    println("oh~")
}


let point = (2,2)
switch point {
case (0,0):
    println("坐标在原点")
case (_,0):
    println("坐标在x轴上")
case (0,_):
    println("坐标在y轴上")
case (-3...3, -3...3):
    println("坐标在长宽为6的正方形内")
default:
    println("在什么地方")
}


var height = 1.72
switch height {
case 1...3 where height == 1.72:
    println("case 1")
case 1...3 where height == 2:
    println("case 2")
default:
    println("default")
}


for i in 1..<10 {
    println("\(i)")
}

let numbers = [1,2,4,7]
for num in numbers{
    println("\(num)")
}

let nameOfAge = [ "lily" : 18, "Candy": 24 ]
for (aName, iAge) in nameOfAge{
    println("\(aName) is \(iAge)")
}



for chare in "zhaoqingjie"{
    println(chare)
}

var j = 0
while j<10{
    j++
}

var m = 0
do {
    m++
}while m<10



