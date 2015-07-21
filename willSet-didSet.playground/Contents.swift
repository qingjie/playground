//: Playground - noun: a place where people can play

import UIKit

class People{
    var firstName : String = ""
    var lastName : String = ""
    var nickName : String = ""
    
    var fullName:String {
        get{
            return nickName + " " + firstName + " " + lastName
        }
    }
    
    var age : Int = 0 {
        willSet {
            println("Will set an new value \(newValue) to age")
        }
        didSet{
            println("age filled changed from \(oldValue) to \(age)")
            if age < 10 {
                nickName = "Little"
            }else{
                nickName = "Big"
            }
        }
    }
    
    func toString() -> String {
        return "Full Name: \(fullName)" + ", Age: \(age)"
    }
}


var me = People()
me.firstName = "Q"
me.lastName = "Zhao"
me.age = 88


