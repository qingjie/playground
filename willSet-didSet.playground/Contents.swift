//: Playground - noun: a place where people can play

import UIKit

/*
属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。有如下特点：
1，不仅可以在属性值改变后触发didSet，也可以在属性值改变前触发willSet。
2，给属性添加观察者必须要声明清楚属性类型，否则编译器报错。
3，willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
4，didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
5，属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
6，即使是设置的值和原来值相同，willSet和didSet也会被调用
*/


class People{
    var firstName : String = ""
    var lastName : String = ""
    var nickName : String = ""
    
    //计算属性
    var fullName:String {
        get{
            return nickName + " " + firstName + " " + lastName
        }
    }
    
    //带属性监视器的普通属性
    var age : Int = 0 {
        //我们需要在age属性变化前做点什么
        willSet {
            println("Will set an new value \(newValue) to age")
        }
        //我们需要在age属性发生变化后，更新一下nickName这个属性
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


/////////////////////////////////

//Swift中类可以使用计算属性，即使用get和set来间接获取/改变其他属性的值
class Calcuator {
    var a : Int = 1
    var b : Int = 1
    
    var sum : Int {
        get{
            return a + b
        }
        set(val){
            b = val - a
        }
    }
}

var cal = Calcuator()
println(cal.sum)
cal.sum = 5
println(cal.b)

/////////////////////////

//对于set有简写方法，简写时，新赋的值默认为newValue
class Calcuator1{
    var a : Int = 1
    var b : Int = 1
    
    var sum : Int {
        get{
            return a + b
        }
        set{
            b = newValue - a
        }
    }
}

var cal1 = Calcuator1()
println(cal1.sum)
cal1.sum = 5
println(cal1.b)

/////////////////////////////

//only get, don't need set
class Calcuator2 {
    var a : Int = 1
    var b : Int = 1
    
    
    var sum : Int {
        return a + b
    }
}






