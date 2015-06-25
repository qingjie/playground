// Playground - noun: a place where people can play

import UIKit

for index in 1...5 {
    println(index)
}

for _ in 1...3{
    println("Hello")
}

var i = 0
var total = 0
for i in 1...10{
    //total = total + i
    total += i
}


let names = ["name1","name2","name3"]
for name in names{
    println(name)
}

var myScore = 70
if myScore < 60{
    println("less 60")
}else if myScore >= 60 && myScore<=70{
    println("60~70")
}else{
    println("other")
}

var goal = "BA"

switch goal{
    case "A":
        println("A")
    case "B":
        println("B")
    default:
        println("Default")
}


