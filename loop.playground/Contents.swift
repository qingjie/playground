//: Playground - noun: a place where people can play

import UIKit

for i in -99...99{
    i*i
}

let str = "Helllo World"
for c in str{
    println(c)
}

let coursesArray = ["AA","BB","CC","DD"]
for item in coursesArray{
    println(item)
}

for (index,item) in enumerate(coursesArray){
    println("\(index): \(item)")
}

let coursesDictionary = [76:"AA",77:"BB",127:"CC"]
for (index,item) in coursesDictionary{
    println("\(index):\(item)")
}

let base = 2
let power = 10
var result = 1
for _ in 1...power{
    result*=base
}
result

for i in -100...100{
    i*i
}

for var i = -100; i <= 100; i++ {
    i*i
}

var i = -100
for ; i <= 100 ; i++ {
    i*i
}

var j = -100
for ; j <= 100 ; {
    j*j
    j++
}

for var i = -6.28 ; i <= 6.28 ; i += 0.1{
    sin(i)
}



var arr:[Int] = []
for var i = 0 ; i < 100 ; i++ {
    arr.append(Int(arc4random()%1000))
}
arr.sort(<)
arr

var min_num = 0 , max_num = arr.count
var mid_num:Int
var target = Int(arc4random()%1000)

while min_num < max_num{
    
    mid_num = (min_num + max_num) / 2
    arr[mid_num]
    
    if arr[mid_num] == target{
        println("\(target) is found in index \(mid_num) ")
        break
    }else if arr[mid_num] > target{
        max_num = mid_num - 1
    }else{
        min_num = mid_num + 1
    }
    
}
if min_num >= max_num {
    println("Cannot find \(target) in arr")
}



var rating:Character = "A"
if rating == "A"{
    println("It is great!")
}else if rating  == "B"{
    println("Just so so")
}else{
    println("It's bad.")
}

switch rating{
    case "a","A":
        println("It is great!")
    case "B":
        println("Just so so")
    default:
       println("It's bad.")
}

let imFloat:Float = 2.8
switch imFloat{
case 2.8:
    println("I'm 2.8")
default:
    println("I am not 2.8")
}

let imBool:Bool = true
switch imBool{
    case true:
        println("I am a true")
    default:
        println("I am a false")
}



let imString:String = "I am a string"
switch imString{
    case "I am a string":
    println("I am a string")
default:
    println("I am not a string")
}


var score = 90
switch score{
case 0:
    println("You got an egg")
case 1..<60:
    println("Sorry, you are failed")
case 61..<70:
    println("just so so")
case 80..<90:
    println("good job")
case 90..<100:
    println("great")
case 100:
    println("awesome")
default:
    println("something warong with you score")
}

var coordinate = (1,1)
switch coordinate{
case (0,0):
    println("0,0")
case (1,0):
    println("1,0")
case (-1,0):
    println("-1,0")
case (0,1):
    println("0,1")
case (0,-1):
    println("0,-1")
default:
    println("default")
}


//使用下划线（_）忽略部分数值
let loginResult = (true,"qingjie")
let (isLoginSuccess,_) = loginResult
if isLoginSuccess{
    println("login success")
}

let coordinat = (0,0)
switch coordinat{
case (0,0):
    println("It is 0,0")
    fallthrough
case (_,0):
    println("(\(coordinat.0),0) is on the x-axis.")
    fallthrough
case (0,_):
    println("(0,\(coordinat.1)) is on the y-axis.")
    fallthrough
case (-2...2,-2...2):
    println("(\(coordinat.0),\(coordinat.1)) is near the origin")
default:
    println("(\(coordinat.0),\(coordinat.1)) is just an ordinary")
    
}



//value binding
let coordina = (2,0)
switch coordina{
case(0,0):
    println("It is at origin")
case(let x,0):
    println("The coordinate is on the x-axis")
    println("the x value is \(x)")
case(0, let y):
    println("The coordinate is on the y-axis")
    println("the y value is \(y)")
case(let x,let y):
   println("The coordinate is (\(x),\(y))")
}


let coordin = (3,3)
switch coordin{
case let (x,y) where x == y:
    println("(\(x),\(y)) is on the line x == y ")
case let (x,y) where x == -y:
    println("(\(x),\(y)) is on the line x == -y ")
case let (x,y):
    println("(\(x),\(y)) is just some arbitrary point")
}

let courseInfo = ("3-2","hello")
switch courseInfo{
case(_,let courseName) where courseName.hasSuffix("llo"):
    println("course <<\(courseName)>> is hello")
default:
    println("<<\(courseInfo.1)>> is others")
}


let courseName = "hello"
switch courseName{
case let str where str.hasSuffix("llo"):
    println("\(courseName)")
default:
    println("others")
}




var primes = [2]
for var i = 3 ; i <= 100 ; i += 2 {
    var isPrime = true
    for aPrime in primes{
        if i%aPrime == 0{
            isPrime = false
            break
        }
    }
    if isPrime{
        primes.append(i)
    }
}
for aPrime in primes{
    println(aPrime)
}



let test_str = "This is a test sentence."
var num = 0
let str1 = test_str.lowercaseString
for c in str1{
    switch c{
        case "a","e","i","o","u":
            break
        case "b","c","d":
        num++
    default:
        break
    }
}
num


let str2 = "qwertyuiasdfghj"
var num1 = 0
for c in str2{
    switch c {
        case "a","f","c":
            break
        default:
            num1++
    }
}
num1



var board = Array<Array<Int>>()
for i in 0...10 {
    board.append(Array(count:10,repeatedValue:0))
}

let randx = Int(arc4random()%10)
let randy = Int(arc4random()%10)
board[randx][randy] = 1
board

var ii = 0 , jj = 0
mainloop:for ii = 0 ; ii < 10 ; ii++ {
    for jj = 0 ; jj < 10 ; jj++ {
        if board[ii][jj] == 1{
            break mainloop
        }
    }
}
println("board[\(ii)][\(jj)] = 1")
