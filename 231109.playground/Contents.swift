import UIKit

var greeting = "Hello, playground"
let dateNow = Date.now
let startOfYear = Calendar.current.dateInterval(of: .year, for: Date.now)?.start
let dateDifference = Calendar.current.dateComponents([.day], from: startOfYear!, to: dateNow).day

