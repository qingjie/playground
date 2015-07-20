//: Playground - noun: a place where people can play

import UIKit

class Student1 {
    var name:String = ""
    var number:Int = 0
}
var student1 = Student1()

class Person {
    var name:String
    var age:Int
    
    init(newName:String,newAge:Int){
        self.name = newName
        self.age = newAge
    }
    
    func say() -> String{
        return "My name is \(name)"
    }
}

var p = Person(newName: "qingjie",newAge: 88)

println(p.say())



