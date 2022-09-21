import UIKit

var greeting = "Hello, playground"

let now = Date()
var datefommater = DateFormatter()
datefommater.dateFormat = "YYYY.MM.dd"
print(datefommater)
datefommater.string(from: now)
