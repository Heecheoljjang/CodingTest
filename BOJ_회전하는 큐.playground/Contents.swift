import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var left = Array(1...input[0])
var right: [Int] = []
var result = 0

func popFirst() {
    right = left.reversed()
    left.removeAll()
    right.removeLast()
    left = right.reversed()
    right.removeAll()
}
func moveLeft() {
    right = left.reversed()
    left.removeAll()
    let temp = right.removeLast()
    left = right.reversed()
    left.append(temp)
    right.removeAll()
}
func moveRight() {
    let temp = left.removeLast()
    left = left.reversed()
    left.append(temp)
    left = left.reversed()
}

while !numbers.isEmpty {
    let idx = left.firstIndex(of: numbers[0])!
    if idx <= left.count - idx {
        for _ in 0..<idx {
            moveLeft()
        }
        popFirst()
        result += idx
    } else {
        for _ in 0..<left.count - idx {
            moveRight()
        }
        result += left.count - idx
        popFirst()
    }
    numbers = numbers.reversed()
    numbers.removeLast()
    numbers = numbers.reversed()
}
print(result)
