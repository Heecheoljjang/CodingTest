import Foundation

let nk = readLine()!
let N = Int(nk.components(separatedBy: " ")[0])!
let K = Int(nk.components(separatedBy: " ")[1])!

var number: [Int] = []
var result: [Int] = []
var temp: Int = 0
var min: Int = 0


//2부터 N까지 모든 정수 적음
for i in 2...N {
    number.append(i)
}
while number.count != 0 {
    if number.count == 1{
        result.append(number[0])
        break
    }
    temp = number.min()!
    min = number.min()!
    while temp <= number.last! {
        if number.contains(temp) {
            number.remove(at: number.firstIndex(of: temp)!)
            result.append(temp)
            temp += min
        } else {
            temp += min
        }
    }
}
print(result[K-1])


