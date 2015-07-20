//: Playground - noun: a place where people can play

import UIKit

func test(name:String) -> Bool{
    return true
}

func test1(name:String) ->(Int,Bool) {
    var position = 1
    var visible = false
    return (position,visible)
}

func test2(numbers:Int...) -> Int {
    var count:Int = 0
    
    for number in numbers {
        count += number
    }
    
    return count
}

var age = 22


/*
//can not compile
func add(age:Int) {
    age +=1
}
*/
// need use var in arg
func add1(var age:Int) {
    age += 1
}

var age2 = 22
func add2(inout age2:Int) {
    age2 += 1
}

add2(&age2)
println(age2)

//////////////////////////////////////

func additive(a:Int, b:Int) -> Int {
    return a + b
}

func printAdditiveResult(addFun:(Int,Int) -> Int, a : Int,b : Int) {
    println("Result :\(addFun(a,b))")
}

printAdditiveResult(additive,5, 7)

///////////////////////////////////

func increase(input:Int) -> Int {
    return input + 1
}

func reduce(input:Int) -> Int{
    return input - 1
}

func chooseFunction(backwards:Bool) -> (Int) -> Int {
    return backwards ? reduce : increase
}

let aFun = chooseFunction(3>2)
println(aFun(3))

