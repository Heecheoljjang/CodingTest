import Foundation

let word = readLine()!.map { "\($0)" }
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var result: [Int] = []
for letter in alphabet {
    if word.contains(letter) {
        result.append(word.firstIndex(of: letter)!)
    } else {
        result.append(-1)
    }
}
print(result.map { "\($0)" }.joined(separator: " "))
