import Foundation

//let n = Int(readLine()!)!
//let triangle: [[Int]] = []
//for _ in 0..<n {
//    triangle.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
let n = 5
var triangle = [[7],[3,8],[8,1,0],[2,7,4,4],[4,5,2,6,5]]
for i in 1..<n {
    for j in 0...i {
        if j <= 0 {
            triangle[i][j] = triangle[i][j] + triangle[i - 1][j]
        } else if j > 0 && j <= i - 1 {
            triangle[i][j] = max(triangle[i - 1][j - 1] + triangle[i][j], triangle[i][j] + triangle[i - 1][j])
        } else {
            triangle[i][j] = triangle[i - 1][j - 1] + triangle[i][j]
        }
    }
}
print(triangle[n - 1].max()!)
