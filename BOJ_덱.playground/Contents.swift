import Foundation

let n = Int(readLine()!)!
var left: [String] = []
var right: [String] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if input[0] == "push_front" {
        right.append(input[1])
    } else if input[0] == "push_back" {
        left.append(input[1])
    } else if input[0] == "pop_front" {
        if left.isEmpty && right.isEmpty {
            print(-1)
        } else {
            if right.isEmpty {
                right = left.reversed()
                left.removeAll()
            }
            print(right.removeLast())
        }
    } else if input[0] == "pop_back" {
        if left.isEmpty && right.isEmpty {
            print(-1)
        } else {
            if left.isEmpty {
                left = right.reversed()
                right.removeAll()
            }
            print(left.removeLast())
        }
    } else if input[0] == "size" {
        print(left.count + right.count)
    } else if input[0] == "empty" {
        if left.isEmpty && right.isEmpty {
            print(1)
        } else {
            print(0)
        }
    } else if input[0] == "front" {
        if left.isEmpty && right.isEmpty {
            print(-1)
        } else {
            right.isEmpty ? print(left[0]) : print(right.last!)
        }
    } else {
        if left.isEmpty && right.isEmpty {
            print(-1)
        } else {
            left.isEmpty ? print(right[0]) : print(left.last!)
        }
    }
}
