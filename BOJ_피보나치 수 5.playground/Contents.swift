import Foundation

let number = Int(readLine()!)!

func fibonacci(_ num: Int) -> Int {
    if num <= 1 {
        return num
    }
    return fibonacci(num - 1) + fibonacci(num - 2)
}
print("\(fibonacci(number))")
