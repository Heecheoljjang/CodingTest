import Foundation
func factorial(_ num: Int) -> Int {
    if num == 1 {
        return 1
    }
    return num * factorial(num - 1)
}
let number = Int(readLine()!)!
if number == 0 {
    print("1")
}
print("\(factorial(number))")

