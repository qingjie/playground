//: Playground - noun: a place where people can play

import UIKit


let statusBarHeight = 20
let basicViewHeight = 548
var inFullScreenMode = true

var viewHeight = basicViewHeight + (inFullScreenMode ? statusBarHeight : 0)

var score = 62
var rate = score >= 60 ? "good" : "bad"


var userNiceName:String?

userNiceName = "qingjie"

if userNiceName != nil
{
    println("Hello + \(userNiceName!)")
}
else
{
    println("Hello,Guest")
}

//let outputName:String = userNiceName != nil ? userNiceName! : "Guest"
let outputName:String = userNiceName ?? "Guest"
println("Hello," + outputName)

let courseNames = ["A","B","C"]
for i in 0..<courseNames.count
{
    courseNames[i]
}


//tuples

let registrationResult = (true,"qingjie","male")
let connectionResult = (404,"Not Found")
let (isRegisterSuccess,nickname,gender) = registrationResult
isRegisterSuccess
nickname
gender

registrationResult.0
registrationResult.1
registrationResult.2

let registrationResult1 = (isRegisterSuccess1:true,nickname1:"qingjie",gender1:"male")
registrationResult1.isRegisterSuccess1
registrationResult1.nickname1
registrationResult1.gender1

// use _ ignore part of value
//let loginResult = (true,"zhao")
let loginResult:(Bool,String) = (true,"zhao")
let (isLoginSuccess,_) = loginResult
if isLoginSuccess
{
    println("login success.")
}



//Optional
var imOptionalVariable:Int?
imOptionalVariable = 12
let userInput = "18"
var age = userInput.toInt()
if age != nil
{
    println("you age is \(age)")
    println("you age is \(age!)")
    println("you age is " + String(age!))
}else{
    println("Invalidate userInput")
}

//optinal binding
if let userAge = userInput.toInt()
{
    println("you age is \(userAge)")
}else{
    println("Invalidate userInput:\(userInput)")
}



let strA:String? = "test"
strA
strA!

let strB:String! = "test"
strB





















