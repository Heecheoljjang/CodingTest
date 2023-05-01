import Foundation

let n: Int = Int(readLine()!)!
let k: Int = Int(readLine()!)!
var sensors: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
sensors = Array(Set(sensors)).sorted(by:<)
var dif: [Int] = []
var result = 0
if sensors.count == 1 {
    print("0")
    exit(0)
}
for i in 0..<sensors.count - 1 {
    dif.append(sensors[i+1] - sensors[i])
}
dif.sort(by:>)
for i in k-1..<dif.count {
    result += dif[i]
}
print(result)
