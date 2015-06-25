//: Playground - noun: a place where people can play

import UIKit

enum GameEnding{
    case Win
    case Lose
    case Draw
}

var yourScore:Int = 100
var enemyScore:Int = 100

var theGameEnding:GameEnding
if yourScore > enemyScore { theGameEnding = .Win}
else if yourScore == enemyScore { theGameEnding = .Draw}
else { theGameEnding = .Lose}

switch theGameEnding
{
case .Win:println("You Win")
case .Lose:println("You Lose")
case .Draw:println("It is a draw")
}

enum Month:Int{
    case Jan=1,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
}
let curMonth:Month = .Jun
curMonth.rawValue

let nextMonth:Month? = Month(rawValue:12)
nextMonth!.rawValue

var userInputNumber = 0
if let theMonth = Month(rawValue: userInputNumber)
{
    switch theMonth{
        case .Jan:println("It is the first month")
        case .Dec:println("It is the last month")
        default:println("It is a normal month")
    }
}else{
    println("Error,No such a month")
}


enum VowelCharacter:Character{
    case A = "a"
    case E = "e"
    case I = "i"
    case O = "o"
    case U = "u"
}

let vowelA = VowelCharacter.A
var userInputCharacter:Character = "s"
if userInputCharacter == vowelA.rawValue
{
    println("It is an 'a'")
}else
{
    println("It is not an 'a'")
}


enum BarCode{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

let productCodeA = BarCode.UPCA(4, 102, 345, 8)
let productCodeB:BarCode = .QRCode("This is a infomation")

switch productCodeA{
case .UPCA(let numberSystem,let manufacture,let identifier,let check):
        println("UPC-A with value of \(numberSystem),\(manufacture),\(identifier),\(check)")
case .QRCode(let productCode):
    println("QR Code with value of \(productCode)")
}
