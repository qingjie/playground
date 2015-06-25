//: Playground - noun: a place where people can play

import UIKit

var arr:[Int] = [1,3,5,7,9,2,4,6,8,0]
sorted(arr)

func compareTwoInts(a:Int,b:Int)->Bool{
    return a>b
}
sorted(arr,compareTwoInts)

sorted(arr,{(a:Int,b:Int)->Bool in return a>b})

var strArr = ["d","cd","bcd","abcd","abc","ab","a"]
sorted(strArr,{(s1,s2)->Bool in
                if count(s1) != count(s2)
                {
                    return count(s1) < count(s2)
                }
                return s1 < s2
                })
arr

arr = [1,3,5,7,9,2,4,6,8,0]
arr = sorted(arr,{(a:Int,b:Int)->Bool in return a>b})
arr
arr = sorted(arr,{a,b in return a>b})
arr
arr = sorted(arr,{a,b in a>b})
arr
arr = sorted(arr,{$0 > $1})
arr
arr = sorted(arr,>)
arr


//trailing closure
strArr = sorted(strArr){
    (s1,s2)->Bool in
    if count(s1) != count(s2)
    {
        return count(s1) < count(s2)
    }
    return s1 < s2

}
strArr

arr = sorted(arr){return fabs(Float($0-5))<fabs(Float($1-5))}
arr
//Capturing values
var num = 3
arr = sorted(arr){return fabs(Float($0-num))<fabs(Float($1-num))}
arr

func tryToChangeValue(var x:Int){ x++ }
var a:Int = 2
tryToChangeValue(a)
a
var b:Int = a
b
b++
b
a


//func calcTotalMiles( todayMiles:Int ) -> ()->Int{
//    var totalMiles = 0
//    return { totalMiles += todayMiles; return totalMiles; }
//}

//var dailyTwoMiles = calcTotalMiles(2)
//dailyTwoMiles(2)






