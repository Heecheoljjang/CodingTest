import Foundation

//let n = Int(readLine()!)!
let n = 5
let aa = ["ABCDE","BCDEF","ABCDA","BAAAA","ACAAA"]
var data: [(Int,[String])] = []
for i in 0..<n {
    //    let input = readLine()!.map { $0 }
    let input = aa[i].map { $0 }
    var tempInt: [Int] = []
    for i in 0..<input.count {
        if !input[i].isLetter {
            tempInt.append(Int(String(input[i]))!)
        }
    }
    data.append((tempInt.reduce(0) { $0 + $1 },input.map { String($0) }))
}
data.sort {
    if $0.1.count == $1.1.count {
        if $0.0 == $1.0 {
            return $0.1.joined() < $1.1.joined()
        }
        return $0.0 < $1.0
    }
    return $0.1.count < $1.1.count
}
for i in data {
    print(i.1.joined())
}
