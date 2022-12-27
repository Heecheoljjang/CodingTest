import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!

let checkNumber = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
let number = String(a * b * c).map { String($0) }

var result: [Int] = []

for i in checkNumber {
    result.append(number.filter { $0 == i }.count)
}
for element in result {
    print(element)
}
