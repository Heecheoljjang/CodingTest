import Foundation

let size = readLine()!
let a = Int(size.components(separatedBy: " ")[0])!
let b = Int(size.components(separatedBy: " ")[1])!

var arr = [[String]](repeating: [""], count: a)

for i in 0..<a {
    arr[i] = readLine()!
}
