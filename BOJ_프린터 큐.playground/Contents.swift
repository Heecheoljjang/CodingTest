import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var priority = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [4,1]
var priority = [1,1,1,1]
var sorted = priority.sorted(by: <)
var target = input[1]
var count = 1
while true {
    if priority[0] == sorted.last! {
        if target == 0 {
            print(count)
            break
        }
        priority.removeFirst()
        sorted.removeLast()
        count += 1
        target -= 1
    } else {
        priority.append(priority.removeFirst())
        target = target == 0 ? priority.count - 1 : target - 1
    }
}
