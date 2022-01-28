var N = Int(readLine()!)!
var arr: [String] = []
var word: String = ""

for _ in 0..<N {
    let str = readLine()!
    arr.append(str)
}

for str in arr {
    word = ""
    for char in str {
        if word.isEmpty {
            word.append(char)
        } else {
            if word.last == char {
                continue
            } else {
                if !word.contains(char) {
                    word.append(char)
                } else {
                    N -= 1
                    break
                }
            }
        }
    }
}
print(N)

