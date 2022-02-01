import Foundation

let k = Int(readLine()!)!
var number: [Int] = []
var result: Int = 0

for _ in 0..<k {
    let temp = Int(readLine()!)!
    if temp != 0 {
        number.append(temp)
    } else {
        if number.isEmpty {
            continue
        } else {
            number.removeLast()
        }
    }
}
for element in number {
    result += element
}
print(result)
