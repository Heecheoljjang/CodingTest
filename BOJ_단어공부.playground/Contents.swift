import Foundation

let word = readLine()!.lowercased().map { "\($0)" }
var dic: [String: Int] = [:]

for i in word {
    if dic[i] == nil {
        dic[i] = 1
    } else {
        if var value = dic[i] {
            value += 1
            dic[i] = value
        }
    }
}
let max = dic.values.max()!
let result = dic.filter { $0.value == max }
if result.count != 1 {
    print("?")
} else {
    print(result.keys.first!.uppercased())
}
