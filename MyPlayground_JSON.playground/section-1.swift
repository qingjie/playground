// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var url = NSURL(string: "http://opendata.epa.gov.tw/ws/Data/AQX?format=json")
var data = NSData(contentsOfURL: url!, options:NSDataReadingOptions.DataReadingUncached,error:nil)

var json:AnyObject = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)!

for result in json as NSArray{
    var site = result.objectForKey("SiteName") as NSString
    var status = result.objectForKey("Status") as NSString
    println("Sitename:\(site)\n quality:\(status)\n")
}
