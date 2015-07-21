// Playground - noun: a place where people can play

import UIKit

struct Account {
    var amount : Double = 0.0
    var owner : String = ""
    
    static var interestRate : Double = 0.668
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}

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