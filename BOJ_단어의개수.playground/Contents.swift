import Foundation
let arr = readLine()!.components(separatedBy: " ")
print(arr.filter { !$0.isEmpty }.count)
