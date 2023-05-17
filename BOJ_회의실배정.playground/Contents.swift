import Foundation

let n = Int(readLine()!)!
var infos: [(Int,Int)] = []
for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map{ Int(String($0))! }
    infos.append((t[0],t[1]))
}
infos.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
}
var cur = 0
var count = 0
for info in infos {
    if cur <= info.0 {
        count += 1
        cur = info.1
    }
}
print(count)
