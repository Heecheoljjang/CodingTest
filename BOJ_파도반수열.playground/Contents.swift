import Foundation

let t = Int(readLine()!)!
var result = [0,1,1,1,2,2]
for i in 6...100 {
    result.append(result[i-1] + result[i-5])
}
for _ in 0..<t {
    print(result[Int(readLine()!)!])
}
