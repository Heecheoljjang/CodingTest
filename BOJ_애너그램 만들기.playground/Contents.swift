import Foundation

var first = readLine()!.map { $0 }
var second = readLine()!.map { $0 }
let totalSet = Set(first + second)
var count = 0

for char in totalSet {
    let firstCount = first.filter { $0 == char }.count
    let secondCount = second.filter { $0 == char }.count
    count += abs(firstCount - secondCount)
}
print(count)
