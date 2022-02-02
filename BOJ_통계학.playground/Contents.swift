import Foundation
//산술평균
func mean(number: [Int]) -> Int {
    
    var result: Int = 0
    
    for i in number {
        result += i
    }
    
    return Int(round(Double(result) / Double(number.count)))
}
//중앙값
func median(number: [Int]) -> Int {
    return number.sorted(by: <)[number.count / 2]
}
//최빈값
func mode(number: [Int]) -> Int {
    var count: [Int:Int] = [:]
    var temp = 0
    for i in number {
        count.updateValue(0, forKey: i)
    }
    for i in number {
        count[i]! += 1
    }
    temp = count.sorted{$0.value > $1.value}[0].value
    if count.filter {$0.value == temp}.count == 1 {
        return count.sorted{$0.value > $1.value}[0].key
    } else {
        return count.sorted{$0.key < $1.key}.sorted{$0.value > $1.value}[1].key
    }
}
//차이
func maxMin(number: [Int]) -> Int {
    return number.max()! - number.min()!
}

let N = Int(readLine()!)!
var number = [Int](repeating: 0, count: N)

for i in 0..<N {
    number[i] = Int(readLine()!)!
}

print(mean(number: number))
print(median(number: number))
print(mode(number: number))
print(maxMin(number: number))

