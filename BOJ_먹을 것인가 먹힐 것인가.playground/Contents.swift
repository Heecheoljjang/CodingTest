import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]; let m = nm[1]
    let a = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    let b = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
    var count = 0
    for i in 0..<a.count {
        for j in 0..<b.count {
            if a[i] > b[j] {
                count += 1
            }
        }
    }
    print(count)
}
