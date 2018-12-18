//: Playground - noun: a place where people can play

import UIKit
import Foundation

//var str = "hello"
//print(str)

//let currentDate = Date()
//var dateFormatter = DateFormatter()
//
//dateFormatter.dateFormat = "yyyy-mm-dd HH:MM:ss"
//print(dateFormatter.string(from: currentDate))


func getDate(date:Date,zone:Int = 0) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:SS"
    dateFormatter.locale = Locale.current
    if zone >= 0 {
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    } else {
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    return dateFormatter.string(from: date)
}

let now = Date()

let beijing = getDate(date: now,zone: 8)
print("北京:\(beijing)")
let dongjing = getDate(date: now,zone: 9)
print("东京:\(dongjing)")
let niuyue = getDate(date: now,zone: -5)
print("纽约:\(niuyue)")
let lundun = getDate(date: now,zone: 0)
print("伦敦:\(lundun)")

print("--------------------------------")


var str = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
//var str1 = str[str.index(str.startIndex,offsetBy:6)..<str.index(str.endIndex,offsetBy:20)]
let index1 = str.index(str.startIndex, offsetBy: 5)
let index2 = str.index(str.startIndex, offsetBy: 20)
let str1 = str[index1..<index2]
print(str1)
//let str2 = str.removeSubrange(str.range(of: "OS"))
let str2 = str.replacingOccurrences(of: "OS", with: "")
print(str2)






let dictionary = ["beijing":beijing,"dongjing":dongjing,"niuyue":niuyue,"lundun":lundun,"str":str] as AnyObject
let fileManager = FileManager.default
if var docPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    docPath.appendPathComponent("test.txt")
    print(docPath.path)
    dictionary.write(to: docPath, atomically: true)
}






let url = URL(string: "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1734910358,1795775967&fm=27&gp=0.jpg")!
let image = try!Data(contentsOf: url)
if var urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first{
    urls.appendPathComponent("image.png")
    try!image.write(to: urls)
}


let url1 = URL(string: "http://www.weather.com.cn/data/sk/101270101.html")!
let data = try!Data(contentsOf: url1)
let object = try!JSONSerialization.jsonObject(with: data, options: .allowFragments)
if var dic = object as? [String:Any]{
    if let weather = dic["weatherinfo"] as? [String:Any]{
        print(weather["city"]!,terminator: ": 温度: ")
        print(weather["temp"]!,terminator: "")
    }
}
























