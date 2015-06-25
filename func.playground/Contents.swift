//: Playground - noun: a place where people can play

import UIKit

func sayHello(name:String?,greeting:String) ->String{
    let result = greeting + " , " + (name ?? "Guest") + "!"
    return result
}


func sayWelcome() ->String{
    return "Welcome to play swift!"
}

func endConversation(){
    println("#Bye#")
}

var nickname:String?
nickname = "qingjie"
println(sayHello(nickname,"Good Morning"))
println(sayWelcome())
endConversation()


func maxminScores(scores:[Int]) -> (maxscore:Int , minscore:Int)?{
    if scores.isEmpty
    {
        return nil
    }
    var curmax = scores[0] , curmin = scores[0]
    for score in scores[1..<scores.count]
    {
        curmax = max(curmax,score)
        curmin = min(curmin,score)
    }
    return (curmax,curmin)
}

//connect to the database
var userScores:[Int]? = [12, 990, 572, 3258, 9999, 1204]
userScores = userScores ?? []
if let result = maxminScores(userScores!)
{
    println("The maximum use score is :\(result.maxscore)")
    println("The minimum use score is :\(result.minscore)")
}

var arr:[Int] = []
arr.insert(1, atIndex: 0)

//内外参数名
func sayHello(#nickname:String,#greeting:String)->String{
    let result = greeting + "," + nickname + "!"
    return result
}
sayHello(nickname:"qingjie", greeting:"Hello")
sayHello("qingjiezhao", "Hello")

//默认参数名
func sayHello1(nickname:String,greeting:String = "Hello")->String{
    let result = greeting + "," + nickname + "!"
    return result
}
sayHello1("zhao")
sayHello1("zhao",greeting:"Good morning")

func add(a:Int , b:Int , others:Int ... ) ->Int{
    var result = a + b
    for number in others
    {
        result += number
    }
    return result
}

var res = add(2,3)
res = add(2,3,4)
res = add(2,3,4,5)

NSLog("%d + %d = %d" , 1 , 2 , 3 )
max( 1 , 2 , 3)
max( 1 , 2 , 3 , 4 )
max(1,2,3,4,res)



func toBinary(var num:Int) -> String{
    var result:String = ""
    while num != 0
    {
        result = String(num%2) + result
        num /= 2
    }
    return result
}

var num = 6
toBinary(num)
num


func swapTwoInts(inout a:Int, inout b:Int){
    let t = a;
    a = b;
    b = t;
}
var x = 0, y = 100
x
y

swapTwoInts(&x, &y)
x
y

swap(&x,&y)
x
y


func add(a:Int,b:Int) -> Int
{
    return a+b
}

let anotherAdd:(Int,Int)->Int = add
anotherAdd(3,4)

func sayHello2(nickname:String)
{
    println("Hello" + nickname)
}

let anothersayHello2:(String)->() = sayHello2
anothersayHello2("qingjie")

func sayHi()
{
    println("Hi")
}
let anotherSayHi:()->Void = sayHi
anotherSayHi()


func changeScore1(inout scores:[Int]){
    for i in 0..<scores.count{
        scores[i] = Int(sqrt(Double(scores[i]))*10)
    }
}

func changeScore2(inout scores:[Int]){
    for i in 0..<scores.count{
        scores[i] = Int(Double(scores[i])/150.0 * 100.0)
    }
}

func changeScore3(inout scores:[Int]){
    for i in 0..<scores.count{
        scores[i] += 3
    }
}

var scores1 = [36,61,78,89,99]
changeScore1(&scores1)
scores1
var scores2 = [88,101,124,137,150]
changeScore2(&scores2)
scores2
var scores3 = [59,61,76,83,95]
changeScore3(&scores3)
scores3


func changeScores(op:(Int)->Int,inout scores:[Int]){
    for i in 0..<scores.count
    {
        scores[i] = op(scores[i])
    }
}

func op1(x:Int)->Int{return Int(sqrt(Double(x))*10)}
func op2(x:Int)->Int{return Int(Double(x)/150.0 * 100.0)}
func op3(x:Int)->Int{return x+3 }

//var scores1 = [36,61,78,89,99]
changeScores(op1,&scores1)
scores1
//var scores2 = [88,101,124,137,150]
changeScores(op2,&scores2)
scores2
//var scores3 = [59,61,76,83,95]
changeScores(op3,&scores3)
scores3


var arr1 = [Int]()
for _ in 1...20
{
    arr1.append(Int(arc4random()%100))
}
arr1
sorted(arr1)

func compareTwoInts1(a:Int,b:Int)->Bool{return a>b}
sorted(arr1,compareTwoInts1)
func compareTwoInts2(a:Int,b:Int)->Bool{
    return fabs(Float(a-50)) < fabs(Float(b-50))
}
sorted(arr1,compareTwoInts2)

var strArr = ["d","cd","bcd","abcd","abc","ab","a"]
sorted(strArr)
func compareTwoString(s1:String,s2:String) -> Bool{
    return count(s1) < count(s2)
}
sorted(strArr,compareTwoString)



func tier1MailFee(weight:Int)->Int
{
    return 1*weight
}
func tier2MailFee(weight:Int)->Int
{
    return 2*weight
}

func chooseMailFeeCalcMethod(weight:Int)->(Int)->Int
{
    return weight <= 10 ? tier1MailFee : tier2MailFee
}

func totalPrice(price:Int,weight:Int)->Int
{
    let mailFeeCalc:(Int)->Int = chooseMailFeeCalcMethod(weight)
    return mailFeeCalc(weight) + price*weight
}








