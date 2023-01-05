import Foundation

let word = readLine()!
let bomb = readLine()!.map { $0 }
var stack: [Character] = []

for char in word {
    stack.append(char)
    if char == bomb.last! && stack.count >= bomb.count && Array(stack[stack.count - bomb.count...stack.count-1]) == bomb {
        for _ in 0..<bomb.count {
            stack.removeLast()
        }
    }
}
if stack.isEmpty {
    print("FRULA")
} else {
    print(stack.map { String($0) }.joined())
}
//MARK: - 비효율적
//var word = readLine()!.map { String($0) }
//let bomb = readLine()!.reversed().map { String($0) }
//let bombCount = bomb.count
//var stack: [String] = []
//var result: [String] = []
//
//for _ in 0..<word.count {
//    stack.append(word.removeLast())
//    while stack.count >= bombCount && Array(stack[stack.count-bombCount...stack.count-1]) == bomb {
//        for _ in 0..<bombCount {
//            stack.removeLast()
//        }
//    }
//}
//if stack.isEmpty {
//    print("FRULA")
//} else {
//    if stack == bomb {
//        print("FRULA")
//    } else {
//        print(stack.reversed().joined())
//    }
//}
