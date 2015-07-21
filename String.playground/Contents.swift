//: Playground - noun: a place where people can play

import UIKit

var str = "Hello,playground"
let str2 = "I'm an immutable string"
var str3 = String()
str = "hi,你好"
str += " world \u{1F496}"

str.isEmpty
str3.isEmpty


for c in str
{
    println(c)
}

var ch:Character = "!"

str.append(ch)

var str4 = "??"
str += str4

count(str)
/////objecive c
var str5:NSString = str4
str5.length

let imInt:Int = 2
let imDouble:Double = 3.1415926
let imBool:Bool = true
let imString:String = "hello"
let imTuple:(Int,Int) = (2,4)
let imOptional:Int? = nil
let imCharacter:Character = "!"

println("Int:\(imInt)\nDouble:\(imDouble)\nBool:\(imBool)\nString\(imString)\nTuple\(imTuple)\nOptional\(imOptional)\nCharacter:\(imCharacter)")

//string comparison
let str_a = "abc"
let str_b = "abc"
str_a == str_b
let str_c = "abd"
str_a < str_c

let str_d = "abcd"
str_d < str_c

//string prefix and suffix
let chapterNames = [
                    "第一章 1.Xcode",
                    "第二章 2. 常量和变量",
                    "第二章 2.元组",
                    "第三章 3.基础运算符",
                    "第三章 3.区间运算符",
                    "第三章 3.逻辑运算符"
                    ]
var cout = 0
for name in chapterNames
{
    //println(name)
    if name.hasPrefix("第二章")
    {
        cout++
    }
}
cout
cout = 0
for name in chapterNames
{
    if name.hasSuffix("运算符")
    {
        cout++
    }
}
cout

///////////////////////////////////////

var s1 = "Hello,qingjie"
s1.hasPrefix("Hello")

s1.capitalizedString
s1

s1.uppercaseString
s1
s1.lowercaseString
s1
var s2 = "  !hi!!!!   "
s2.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
s2
s2.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " !"))
//split
var s3 = "welcome to real world."
s3.componentsSeparatedByString(" ")
s3 = "welcome to play swift! Step-by-Step learn from now."
s3.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: " !-"))


//join
var s4 = "-"
s4.join(["1","2","3"])


var string = "Welcome to Play Swift! Step by Step learn Swift language from now!"
//range
string.rangeOfString("Step")
string.rangeOfString("Step", options: NSStringCompareOptions.BackwardsSearch)
string.rangeOfString("welcome", options: NSStringCompareOptions.CaseInsensitiveSearch)

string.startIndex
string.endIndex
let strRange = Range<String.Index>(start:string.startIndex,end:string.endIndex)

//let startIndex = string.startIndex
let startIndex:String.Index = string.startIndex
let endIndex:String.Index = advance(startIndex,10)
let searchRange = Range<String.Index>(start:startIndex,end:endIndex)
string.rangeOfString("Step", options: NSStringCompareOptions.CaseInsensitiveSearch, range: searchRange)

//substring
var toIndex = advance(string.startIndex,4)
string.substringToIndex(toIndex)
var fromIndex = advance(string.startIndex,14)
string.substringFromIndex(fromIndex)

string.substringWithRange(Range<String.Index>(start:toIndex,end:fromIndex))

//insert
var insertIndex = advance(string.startIndex, 22)
string.insert("?", atIndex: insertIndex)

//remove
string.removeAtIndex(insertIndex)
string

string.removeRange(Range<String.Index>(start:string.startIndex,end:insertIndex))

//replace
string
var repaceEndIndex = advance(string.startIndex, 13)
string.stringByReplacingCharactersInRange(Range<String.Index>(start:string.startIndex,end:repaceEndIndex), withString: "Step-by_step")
string





/////////////////////////////////

class SubString {
    var str : String = ""
    
    init(str : String) {
        self.str = str
    }
    
    /**下标脚本：获取/设置部分字符串**/
    subscript(start:Int,length:Int) -> String {
        get{
            return (str as NSString).substringWithRange(NSRange(location: start , length:length))
        }
        
        set{
            var tmp = Array(str)
            str = ""
            var s = ""
            var e = ""
            
            for(idx,item) in enumerate(tmp) {
                if(idx < start){
                    s += "\(item)"
                }
                
                if(idx >= start + length) {
                    e += "\(item)"
                }
            }
            
            str = s + newValue + e
        }
    }
    /**下标脚本：获取/设置字符**/
    subscript(index:Int) -> String {
        get {
            return String(Array(str)[index])
        }
        
        set {
            var tmp = Array(str)
            tmp[index] = Array(newValue)[0]
            str = ""
            for ( idx , item ) in enumerate(tmp) {
                str += "\(item)"
            }
        }
    }
    
}

var str = SubString(str:"www.syr.edu")
//获取字符串：edu
println(str[8,3])
//获取字符串：e
println(str[8])
//设置部分字符串
str[8,3] = "EDU"
//设置部分字符
str[0] = "Q"
str
println(str[0,11])

//通过类扩展，也可以直接给String类添加索引功能
extension String {
    subscript(start:Int,length:Int) -> String {
        get {
            return (self as NSString).substringWithRange(NSRange(location:start,length:length))
        }
        
        set{
            var tmp = Array(self)
            var s = ""
            var e = ""
            for (idx,item) in enumerate(tmp){
                if(idx < start){
                    s += "\(item)"
                }
                if(idx >= start + length) {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
        }
    }
    
    subscript(index:Int) -> String {
        get{
            return String(Array(self)[index])
        }
        
        set{
            var tmp = Array(self)
            tmp[index] = Array(newValue)[0]
            self = ""
            for(idx,item) in enumerate(tmp){
                self += "\(item)"
            }
        }
    }
}

var str1 = "www.syr.edu"
//获取字符串：edu
println(str1[8,3])
//获取字符串：e
println(str1[8])
//设置部分字符串
str1[8,3] = "EDU"
//设置部分字符
str1[0] = "Q"
str1
println(str1[0,11])


//使用一维数组结合下标方法一定程度上模拟实现了二维数组
class Matrix{
    let rows : Int, columns : Int
    var grid : [Double]
    
    init(rows : Int, columns : Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count:rows * columns, repeatedValue:0.0)
    }
    
    func indexIsValidForRow(row: Int, column : Int) -> Bool {
        return row >= 0 && row < rows && columns >= 0 && column < columns
    }
    
    subscript(row:Int,column:Int) -> Double{
        get{
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            return grid[(row * columns) + column]
        }
        
        set{
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
}

var value = Matrix(rows:20,columns:20)
value[10,10] = 20
println(value)


