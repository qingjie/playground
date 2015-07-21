// Playground - noun: a place where people can play

import UIKit

//结构体struct和枚举enum的静态属性，静态方法使用static关键字
struct Account {
    var amount : Double = 0.0
    var owner : String = ""
    
    static var interestRate : Double = 0.668
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}

//类class的类型属性，类型方法使用class关键字
class Account1 {
    var amount : Double = 0.0
    var owner : String = ""
    
    class var staticProp : Double {
        return 0.668
    }
    
    class func interestBy(amount : Double) -> Double {
        return 0.8886 * amount
    }
}

println(Account1.staticProp)
