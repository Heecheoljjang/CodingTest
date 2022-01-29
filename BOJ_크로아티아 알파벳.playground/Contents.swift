let word: String = "dzc="
var count: Int = 0
var temp: String = ""
var arr: [String] = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z=" ]

for char in word {
    if temp.isEmpty {
        if char == "c" || char == "d" || char == "l" || char == "n" || char == "s" || char == "z" {
            temp.append(char)
        } else {
            count += 1
        }
    } else {
        temp.append(char) // count가 2인 상태
        if arr.contains(temp) {
            count += 1
            temp = ""
        } else {
            if temp == "dz" {
                continue
            } else {
                if temp.count == 2 {
                    count += 1
                    temp.removeFirst()
                } else{
                    count += 3
                    temp = ""
                }
            }
        }
    }
}
print(count)
