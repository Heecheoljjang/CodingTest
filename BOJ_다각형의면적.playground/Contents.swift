import Foundation

//let n = Int(readLine()!)!
//var points: [(Int,Int)] = []
//for _ in 0..<n {
//    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
//    points.append((t[0],t[1]))
//}
let n = 4
var points = [(0,0),(0,10),(10,10),(10,0)]
var plus = 0
var minus = 0
var result = 0.0
//첫번째꺼 추가
points.append(points[0])

for i in 0..<points.count-1 {
    plus += points[i].0 * points[i+1].1
    minus += points[i].1 * points[i+1].0
}
result = abs(Double(plus) - Double(minus))
print(result)
result = result / 2.0
result = round(result * 10) / 10
print(result)
