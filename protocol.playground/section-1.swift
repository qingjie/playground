// Playground - noun: a place where people can play

import UIKit

/*


类和结构体有许多相同之处，也有许多不同之处。

二者区别如下：
1，类可以继承和扩展，结构体不可以
2，可以让一个类的实例来反初始化，释放存储空间，结构体做不到
3，类的对象是引用类型，而结构体是值类型。所以类的赋值是传递引用，结构体则是传值。

相同点：
1，定义属性用于储存值
2，定义方法用于提供功能
3，定义下标用于通过下标语法访问值
4，定义初始化器用于生成初始化值

*/

/*
1，private
private访问级别所修饰的属性或者方法只能在当前的Swift源文件里可以访问。

2，internal（默认访问级别，internal修饰符可写可不写）
internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
如果是App代码，也是在整个App代码，也是在整个App内部可以访问。

3，public
可以被任何人使用
*/

/////////////////////////////////////////////////////////////////////////////

//Swift中协议类似于别的语言里的接口，协议里只做方法的声明，包括方法名、返回值、参数等信息，而没有具体的方法实现。

protocol Person{
    //读写属性
    var name : String{get set}
    
    //只读属性
    var age:Int{get}
    
    //类型方法
    static func method1()
    //实例方法
    func method2() -> Int
    
    //突变方法
    mutating func method3()
    
}


protocol Animal{
    func move()
}

protocol Bird:Animal {
    func song()
}

class Chiken:Bird{
    func song(){
        println("sing...")
    }
    
    func move(){
        println("walk...")
    }
}

//如果某个类集继承了某个父类，又遵循了某个协议，那么冒号后面应该先写父类，再写协议
//class CC:继承的父类, 协议1, 协议2{}