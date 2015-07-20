//: Playground - noun: a place where people can play

import UIKit

class Teacher{
    var tName : String
   
    //don't forget the keyword weak
    weak var student : Student?
    
    init(name:String) {
        tName = name
        println("\(tName)  init is done")
    }
    
    deinit{
        println("\(tName) deinit is done")
    }
}

class Student{
    var sName : String
    var teacher : Teacher?
    
    init(name:String) {
        sName = name
        println("\(sName)  init is done")
    }
    
    deinit{
        println("\(sName) deinit is done")
    }
    
}

var teacher: Teacher?
var student:Student?
teacher = Teacher(name: "Professor A")
student = Student(name: "Student A")

teacher!.student = student
student!.teacher = teacher

teacher = nil
student = nil

//////////////////////////////////////////////////////////



class JsonElement {
    let name : String
    let jValue : String?
    
    lazy var asJson:() -> String = {
        //don't forget the following line
        [unowned self] in
        if let text = self.jValue {
            return "\(self.name):\(text)"
        }else{
            return "text is nil"
        }
        
    }
    
    init(name:String,text:String){
        self.name = name
        self.jValue = text
        println("init closure")
    }
    
    deinit{
        println("deinit closure")
    }
}

var p:JsonElement? = JsonElement(name: "SU", text: "www.syr.edu")
println(p!.asJson())
p = nil


