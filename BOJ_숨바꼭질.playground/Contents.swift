import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [5,17]
var count = [Int](repeating: -1, count: 100001)
let target = input[1]
var queue = [input[0]]
var idx = 0
count[input[0]] = 0
while count[target] == -1 {
    let current = queue[idx]
    idx += 1
    let temp = [current + 1, current - 1, current * 2]
    for i in temp {
        if i < 0 || i > 100000 {
            continue
        }
        if count[i] == -1 {
            count[i] = count[current] + 1
            queue.append(i)
        }
    }
}
print(count[target])
