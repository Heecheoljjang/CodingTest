import Foundation

//let n = file.readInt()
let n = 10
var aa = [5,2233,1601,90100,13009,802,5000000,301,7654321,210]
var numbers: [Int] = []
for i in 0..<n {
    numbers.append(Int(String("\(aa[i])".reversed()))!)
    
}
var answer = ""
for number in numbers.sorted(by: <) {
    answer += "\(number)\n"
}
print(answer)
