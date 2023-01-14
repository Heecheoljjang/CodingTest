import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var total: [[Int]] = []
var count = 0

for _ in 0..<input[0] {
    let universe = readLine()!.split(separator: " ").map { Int(String($0))! }
    let sorted = universe.sorted(by: <)
    var temp: [Int] = []
    for num in sorted {
        temp.append(universe.firstIndex(of: num)!)
    }
    total.append(temp)
}
for i in Set(total) {
    let temp = total.filter { $0 == i }.count
    count += temp * (temp - 1)
}
print(count / 2)
