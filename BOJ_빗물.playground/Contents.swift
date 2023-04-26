import Foundation

//let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let h = input[0]; let w = input[1]
//let block = readLine()!.split(separator: " ").map{ Int(String($0))! }
let input = [3,5]
let block = [1,0,3,2,4]
var result = 0
var cur = block.max()!

while cur > 0 {
    var temp = 0
    var ch = false
    print("cur",cur)
    for i in 0..<block.count {
        if block[i] >= cur {
            if ch {
                print(temp,cur)
                result += temp
                temp = 0
            } else {
                ch = true
            }
        } else {
            if ch {
                temp += 1
            }
        }
    }
    cur -= 1
}
print(result)
