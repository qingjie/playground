// Playground - noun: a place where people can play

import UIKit

///////////////////////1.遍历一个目录下的所有文件///////////////

//假设用户文档下有如下文件和文件夹[test1.txt,fold1/test2.txt]
let manager = NSFileManager.defaultManager()
let urlForDocument = manager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
let url = urlForDocument[0] as! NSURL
var error:NSErrorPointer = nil


//（1）对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
let contentsOfPath = manager.contentsOfDirectoryAtPath(url.path!, error: error)
//contentsOfPath：Optional([fold1, test1.txt])
println("contentsOfPath: \(contentsOfPath)")

//（2）类似上面的，对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
let contentsOfURL = manager.contentsOfDirectoryAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, error: error);
//contentsOfURL：Optional([file://Users/.../Application/.../Documents/fold1/,
// file://Users/.../Application/.../Documents/test1.txt])
println("contentsOfURL: \(contentsOfURL)")

//（3）深度遍历，会递归遍历子文件夹（但不会递归符号链接）
let enumeratorAtPath = manager.enumeratorAtPath(url.path!)
//enumeratorAtPath：Optional([fold1, fold1/test2.txt, test1.txt])
println("enumeratorAtPath: \(enumeratorAtPath?.allObjects)")

//（4）类似上面的，深度遍历，会递归遍历子文件夹（但不会递归符号链接）
let enumeratorAtURL = manager.enumeratorAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, errorHandler:nil)
//contentsOfURL：Optional([file://Users/.../Application/.../Documents/fold1/,
// file://Users/.../Application/.../Documents/fold1/test2.txt,
// file://Users/.../Application/.../Documents/test1.txt])
println("enumeratorAtURL: \(enumeratorAtURL?.allObjects)")

//（5）深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
let subPaths = manager.subpathsAtPath(url.path!)
//subPaths：Optional([fold1, fold1/test2.txt, test1.txt])
println("subPaths: \(subPaths)")


///////2，判断文件或文件夹是否存在//////////
let fileManager = NSFileManager.defaultManager()
let filePath:String = NSHomeDirectory() + "/Documents/hangge.txt"
var exist = fileManager.fileExistsAtPath(filePath)

//////////////////////////////////3，创建文件夹 ///////////////////////

//方法1
let myDirectory:String = NSHomeDirectory() + "/Documents/myFolder/Files"
let fileManager1 = NSFileManager.defaultManager()
var error1:NSErrorPointer = nil
//withIntermediateDirectories为ture表示路径中间如果有不存在的文件夹都会创建
var isSuccess:Bool = fileManager.createDirectoryAtPath(myDirectory, withIntermediateDirectories: true, attributes: nil, error: error1)

//方法2
func createFolder(name:String,baseUrl:NSURL){
    let manager = NSFileManager.defaultManager()
    var error:NSErrorPointer = nil
    let folder = baseUrl.URLByAppendingPathComponent(name, isDirectory: true)
    println("文件夹: \(folder)")
    let exist = manager.fileExistsAtPath(folder.path!)
    if !exist {
        let createSuccess = manager.createDirectoryAtURL(folder, withIntermediateDirectories: true, attributes: nil, error: error)
        println("文件夹创建结果: \(createSuccess)")
    }
}

//在文档目录下新建folder目录
let manager2 = NSFileManager.defaultManager()
let urlForDocument2 = manager2.URLsForDirectory( NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let url2 = urlForDocument[0] as! NSURL
var error2:NSErrorPointer = nil
createFolder("folder", url2)

///////////////////////4，将对象写入文件//////////////////////////////////
//1.把String保存到文件
let filePath3:String = NSHomeDirectory() + "/Documents/hangge.txt"
var error3:NSErrorPointer = nil
var info3 = "Welcome to Syracuse"
info3.writeToFile(filePath3, atomically: true, encoding: NSUTF8StringEncoding, error: error3)

//2.把图片保存到文件路径下
let filePath4:String = NSHomeDirectory() + "/Documents/syr.png"
var image = UIImage(named: "apple.png")
var data:NSData = UIImagePNGRepresentation(image)
data.writeToFile(filePath4, atomically: true)

//3.把NSArray保存到文件路径下
var array = NSArray(objects: "aaa","bbb","ccc")
let filePath5:String = NSHomeDirectory() + "/Documents/array.plist"
array.writeToFile(filePath5, atomically: true)

//4.把NSDictionary保存到文件路径下
var dictionary = NSDictionary(objects: ["111","222"], forKeys: ["aaa","bbb"])
let filePath6:String = NSHomeDirectory() + "/Documents/dictionary.plist"
dictionary.writeToFile(filePath6, atomically: true)

///////////////////////////创建文件////////////////////////////
func createFile(name:String,fileBaseUrl:NSURL){
    let manager = NSFileManager.defaultManager()
    var error:NSErrorPointer = nil
    
    let file = fileBaseUrl.URLByAppendingPathComponent(name)
    println("文件: \(file)")
    let exist = manager.fileExistsAtPath(file.path!)
    if !exist {
        let data = NSData(base64EncodedString:"aGVsbG8gd29ybGQ=",options:.IgnoreUnknownCharacters)
        let createSuccess = manager.createFileAtPath(file.path!,contents:data,attributes:nil)
        println("文件创建结果: \(createSuccess)")
    }
}

//在文档目录下新建test.txt文件
let manager7 = NSFileManager.defaultManager()
let urlForDocument7 = manager7.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let url7 = urlForDocument7[0] as! NSURL
var error7:NSErrorPointer = nil
createFile("test.txt", url7)
//createFile("folder/new.txt", fileBaseUrl: url)

////////////////////////复制文件 ////////////////////////////
//方法1
let fileManager8 = NSFileManager.defaultManager()
let homeDirectory8 = NSHomeDirectory()
var error8:NSErrorPointer = nil
let srcUrl8 = homeDirectory8 + "/Documents/syr.txt"
let toUrl8 = homeDirectory8 + "/Documents/syr-copyed.txt"
fileManager.copyItemAtPath(srcUrl8, toPath: toUrl8, error: error8)

//方法2
// 定位到用户文档目录
let manager9 = NSFileManager.defaultManager()
let urlForDocument9 = manager9.URLsForDirectory( NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let url9 = urlForDocument9[0] as! NSURL
var error9:NSErrorPointer = nil

let contentsOfURL9 = manager.contentsOfDirectoryAtURL(url9, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, error: error9);
// 将test.txt文件拷贝到文档目录根目录下的copyed.txt文件
let srcUrl9 = url9.URLByAppendingPathComponent("test.txt")
let toUrl9 = url9.URLByAppendingPathComponent("copyed.txt")

let copyItemSuccess = manager9.copyItemAtURL(srcUrl9, toURL: toUrl9, error: error9)
println("复制结果: \(copyItemSuccess)")


///////////////////////////////////移动文件 ///////////////////

//方法1
let fileManager10 = NSFileManager.defaultManager()
let homeDirectory10 = NSHomeDirectory()
var error10:NSErrorPointer = nil
let srcUrl10 = homeDirectory10 + "/Documents/syr.txt"
let toUrl10 = homeDirectory10 + "/Documents/moved"
fileManager10.moveItemAtPath(srcUrl10, toPath: toUrl10, error: error10)

//方法2
// 定位到用户文档目录
let manager11 = NSFileManager.defaultManager()
let urlForDocument11 = manager.URLsForDirectory( NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let url11 = urlForDocument[0] as! NSURL
var error11:NSErrorPointer = nil

let contentsOfURL11 = manager11.contentsOfDirectoryAtURL(url11, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, error: error11);
let srcUrl11 = url11.URLByAppendingPathComponent("test.txt")
let toUrl11 = url11.URLByAppendingPathComponent("copyed.txt")
// 移动srcUrl中的文件（test.txt）到toUrl中（copyed.txt）
let moveItemSuccess = manager11.moveItemAtURL(srcUrl11, toURL: toUrl11, error: error11)

/////////////////////////////////////删除文件 ////////////////////////
//方法1
let fileManager12 = NSFileManager.defaultManager()
let homeDirectory12 = NSHomeDirectory()
var error12:NSErrorPointer = nil
let srcUrl12 = homeDirectory12 + "/Documents/syr.txt"
fileManager12.removeItemAtPath(srcUrl12, error: error12)

//方法2
// 定位到用户文档目录
let manager13 = NSFileManager.defaultManager()
let urlForDocument13 = manager13.URLsForDirectory( NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let url13 = urlForDocument13[0] as! NSURL
var error13:NSErrorPointer = nil

let contentsOfURL13 = manager13.contentsOfDirectoryAtURL(url13, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, error: error13);
let toUrl13 = url13.URLByAppendingPathComponent("copyed.txt")
// 删除文档根目录下的toUrl路径的文件（copyed.txt文件）
let removeItemSuccess13 = manager13.removeItemAtURL(toUrl13, error: error13)
println("删除结果: \(removeItemSuccess13)")



/////////////////////////删除目录下所有的文件/////////////////////
//方法1：获取所有文件，然后遍历删除
let fileManager14 = NSFileManager.defaultManager()
var error14:NSErrorPointer = nil
var myDirectory14 = NSHomeDirectory() + "/Documents/Files"
var fileArray14:[AnyObject]? = fileManager14.subpathsAtPath(myDirectory14)
for fn in fileArray14!{
    fileManager14.removeItemAtPath(myDirectory14 + "/\(fn)", error: error14)
}

//方法2：删除目录后重新创建该目录
let fileManager15 = NSFileManager.defaultManager()
var error15:NSErrorPointer = nil
var myDirectory15 = NSHomeDirectory() + "/Documents/Files"
fileManager15.removeItemAtPath(myDirectory15, error: error15)
fileManager15.createDirectoryAtPath(myDirectory15, withIntermediateDirectories: true,
    attributes: nil, error: error15)

////////////////////////////读取文件//////////////////////////////

let manager16 = NSFileManager.defaultManager()
let urlsForDocDirectory16 = manager16.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let docPath16:NSURL = urlsForDocDirectory16[0] as! NSURL
let file16 = docPath16.URLByAppendingPathComponent("test.txt")

//方法1
var readHandler16 = NSFileHandle(forReadingFromURL:file16,error:nil)!
var data16 = readHandler16.readDataToEndOfFile()
var readString16 = NSString(data: data16, encoding: NSUTF8StringEncoding)
println("文件内容: \(readString16)")
//方法2
let data17 = manager16.contentsAtPath(file16.path!)
var readString17 = NSString(data: data17!, encoding: NSUTF8StringEncoding)
println("文件内容: \(readString17)")


////////////////////////////////在任意位置写入数据/////////////////////
let string18 = "添加一些文字到文件末尾"
let appendedData18 = string18.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
let manager18 = NSFileManager.defaultManager()
let urlsForDocDirectory18 = manager18.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let docPath18:NSURL = urlsForDocDirectory18[0] as! NSURL
let file18 = docPath18.URLByAppendingPathComponent("test.txt")
let writeHandler18 = NSFileHandle(forWritingToURL:file18,error:nil)!
writeHandler18.seekToEndOfFile()
writeHandler18.writeData(appendedData18!)

////////////////////////文件权限判断/////////////////
let manager19 = NSFileManager.defaultManager()
let urlsForDocDirectory19 = manager19.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let docPath19:NSURL = urlsForDocDirectory19[0] as! NSURL
let file19 = docPath19.URLByAppendingPathComponent("test.txt")

let readable19 = manager19.isReadableFileAtPath(file19.path!)
println("可读: \(readable19)")
let writeable19 = manager19.isWritableFileAtPath(file19.path!)
println("可写: \(writeable19)")
let executable19 = manager19.isExecutableFileAtPath(file19.path!)
println("可执行: \(executable19)")
let deleteable19 = manager19.isDeletableFileAtPath(file19.path!)
println("可删除: \(deleteable19)")

////////////////////////////////////获取文件属性（创建时间，修改时间，文件大小，文件类型等信息）//////////////////

let manager20 = NSFileManager.defaultManager()
let urlsForDocDirectory20 = manager20.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let docPath20:NSURL = urlsForDocDirectory20[0] as! NSURL
let file20 = docPath20.URLByAppendingPathComponent("test.txt")

let attributes20 = manager20.attributesOfItemAtPath(file20.path!,error:nil) //结果为AnyObject类型
println("attributes: \(attributes20!)")


///////////////////////////////////文件/文件夹比较//////////////////////////////////////////

let manager21 = NSFileManager.defaultManager()
let urlsForDocDirectory21 = manager21.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains:NSSearchPathDomainMask.UserDomainMask)
let docPath21:NSURL = urlsForDocDirectory21[0] as! NSURL
let contents21 = manager21.contentsOfDirectoryAtPath(docPath21.path!,error:nil)!

//下面比较前面两个文件是否内容相同（该方法也可以用来比较目录）
let count21 = contents21.count
if count21 > 1 {
    let path121 = docPath21.path! + "/" + (contents21[0] as! String)
    let path221 = docPath21.path! + "/" + (contents21[1] as! String)
    let equal21= manager21.contentsEqualAtPath(path121,andPath:path221)
    println("比较结果: \(equal21)")
}
