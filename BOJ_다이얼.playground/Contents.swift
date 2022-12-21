import Foundation

let str = readLine()!
let number: [String: Int] = [
    "ABC": 2,
    "DEF": 3,
    "GHI": 4,
    "JKL": 5,
    "MNO": 6,
    "PQRS": 7,
    "TUV": 8,
    "WXYZ": 9,
]
var result = 0
for char in str {
    let key = number.keys.filter { $0.contains(char) }[0]
    result += (number[key]! + 1)
}
print(result)
