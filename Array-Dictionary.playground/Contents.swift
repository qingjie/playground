//: Playground - noun: a place where people can play

import UIKit

////////array//////////////

var array = ["A","B","C","D","E"]
var array2:[String] = ["A","B","C","D","E"]
var array3:Array<String> = ["A","B","C","D","E"]

array[0] = "AA"
array

var array4 = [Int]()
var str = String()
var array5 = Array<String>()
array5 = []
array5
array5.append("A")
array5

var array6:[Int] = []
array6.append(2)
var array7:Array<Int> = []
array7.append(2)


//clear array
array = [String]()
array = Array<String>()

array6 = [Int](count: 10, repeatedValue: 0)
array6
var array8 = [2,3,4]
var array68 = array6+array8
array68


array.count
array.isEmpty

array.append("G")
array += ["H"]
array += ["I","J","K"]
array
array.insert("Hello", atIndex: 2)
array
array.removeAtIndex(0)
array
array.removeLast()
array

println("-----start-----")
//array[0]
//array[0]="AA"
//array

array[1...3] = ["CC","DD","EE"]
array

array[1...3] = ["Hello"]
array

println("------end----")


for index in 0..<array.count{
    println(array[index])
}

for item in array{
    println(item)
}

for (index,item) in enumerate(array){
    println("\(index) - \(item)")
}





//////////////Dictionary/////////////
var courses = [76:"A",77:"B",127:"C"]
var websites = ["search engine":"google","website":"sohu"]


var courses2:Dictionary<Int,String> = [76:"A",77:"B",127:"C"]
var websites2:Dictionary<String,String> = ["search engine":"google","website":"sohu"]

var courses3:[Int:String] = [76:"A",77:"B",127:"C"]
var websites3:[String:String] = ["search engine":"google","website":"sohu"]

var dict = Dictionary<Int,String>()
var dict2 = [Int:String]()

//websites = Dictionary<String,String>()
//websites = [String:String]()
//websites = [:]

courses.count
courses.isEmpty

courses[76]

websites["website"]
//Optional
courses[73]
websites["news"]
"Hello: " + courses[76]!

//Add
courses[73] = "D"
courses
//Update
courses[76] = "AA"
courses
var oldValue = courses.updateValue("AAA", forKey: 76)
oldValue
courses

courses[73] = nil

courses[73] = "D"
courses

let oldValue2 = courses.removeValueForKey(73)
oldValue2
courses

for (key,value) in courses{
    
    println("\(key):\(value)")
}

courses.keys
courses.values

for key in courses.keys{
    println(key)
}

for value in courses.values{
    println(value)
}

Array(courses.keys)
[Int](courses.keys)

/////////////////demo////////////////////////////////////
let colors =
[
    "Air Force Blue":(red:93,green:138,blue:168),
    "Bitterysweet":(red:254,green:111,blue:94),
    "Canary Yellow":(red:255,green:239,blue:0),
    "Dark Orange":(red:255,green:140,blue:0),
    "Electric Violet":(red:143,green:0,blue:255),
    "Fern":(red:113,green:188,blue:120),
    "Gamboge":(red:228,green:155,blue:15),
    "Hollywood Cerise":(red:244,green:0,blue:161),
    "Iceterine":(red:252,green:247,blue:94),
    "Jazzberry Jam":(red:165,green:11,blue:94)
]

var backView = UIView(frame:CGRectMake(0.0, 0.0, 320.0, CGFloat(colors.count * 50)))
backView.backgroundColor = UIColor.blackColor()
backView

var index = 0
for(colorName,rgbTuple) in colors
{
    var colorStripe = UILabel(frame:CGRectMake(0.0, CGFloat(index*50+5), 320.0, 40.0))
    colorStripe.backgroundColor = UIColor(red:CGFloat(rgbTuple.red) / 255.0,green:CGFloat(rgbTuple.green) / 255.0,blue:CGFloat(rgbTuple.blue) / 255.0,alpha: 1.0
    )
    
    colorStripe
    
    var colorNameLabel = UILabel(frame:CGRectMake(0.0, 0.0, 300.0, 40.0))
    colorNameLabel.font = UIFont(name:"Arial",size:24.0)
    colorNameLabel.textColor = UIColor.blackColor()
    colorNameLabel.textAlignment = NSTextAlignment.Right
    colorNameLabel.text = colorName
    colorStripe.addSubview(colorNameLabel)
    
    backView.addSubview(colorStripe)
    index++
}

backView





