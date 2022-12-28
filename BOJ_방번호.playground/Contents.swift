import Foundation

let room = readLine()!.map { String($0) }
var numbers = [Int](repeating: 0, count: 10)
for num in room {
    numbers[Int(String(num))!] += 1
}
numbers[9] += numbers[6]
numbers[6] = 0
if numbers.firstIndex(of: numbers.max()!) == 9 {
    print((numbers[9] / 2) + (numbers[9] % 2))
} else {
    print(numbers.max()!)
}

