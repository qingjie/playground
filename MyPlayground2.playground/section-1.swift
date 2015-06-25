// Playground - noun: a place where people can play

import UIKit

struct Dollar{
    var dollar_US:Double
    var USconvNT:Double{
        get{
            return dollar_US * 31
        }
        set{
            dollar_US = newValue / 31
        }
    }
}
var item = Dollar(dollar_US:100)
item.USconvNT = 2000
item.dollar_US



struct Point{
    var x = 0.0, y = 0.0
}

class Side{
    var length :Double
    init(length:Double){
        self.length = length
    }
    
}

class Square{
    var originPoint: Point
    var xandy: Side
    
    init(originPoint: Point,xandy: Side){
        self.originPoint = originPoint
        self.xandy = xandy
    }
    
    
}
var square01 = Square(originPoint:Point(x:0,y:0),xandy:Side(length:10))

