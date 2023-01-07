import Foundation

var numbers = Array(1...Int(readLine()!)!)
var count = 0
if numbers.count == 1 {
    print(numbers.last!)
} else {
    while numbers[numbers.count - 2] != 0 {
        numbers[count] = 0
        numbers.append(numbers[count + 1])
        numbers[count + 1] = 0
        count += 2
    }
    print(numbers.last!)
}
