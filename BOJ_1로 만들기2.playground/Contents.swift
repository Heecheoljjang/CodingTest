import Foundation

//let n = Int(readLine()!)!
let n = 1
var result = Array(repeating: 0, count: n + 1)
var numbers = [0,1]
if n == 1 {
    print(0)
    print(1)
    exit(0)
}
for i in 2...n {
    var check = 0
    result[i] = result[i - 1] + 1
    check = i - 1
    if i % 2 == 0 {
        result[i] = min(result[i], result[i / 2] + 1)
        if result[i] > result[i / 2] {
            check = i / 2
        }
    }
    if i % 3 == 0 {
        result[i] = min(result[i], result[i / 3] + 1)
        if result[i] > result[i / 3] {
            check = i / 3
        }
    }
    numbers.append(check)
}
print(result[n])
var count = n
var temp = ""
for _ in 0...result[n] {
    temp += "\(count) "
    count = numbers[count]
}
print(temp)
