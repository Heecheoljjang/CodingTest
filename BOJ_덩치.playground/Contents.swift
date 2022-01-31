import Foundation //Foundation을 import해야 components를 사용할 수 있음

let N = Int(readLine()!)!
var str = [String](repeating: "", count: N)
var result = [Int](repeating: 0, count: N)
var size = [[String]](repeating: [""], count: N)
var count: Int = 1

for i in 0..<N {
    str[i] = readLine()!
}
for i in 0..<N {
    size[i] = str[i].components(separatedBy: " ")
}
for i in 0..<N {
    for j in 0..<N {
        if Int(size[i][0])! < Int(size[j][0])! && Int(size[i][1])! < Int(size[j][1])! { //덩치가 큰 경우
            count += 1
        }
    }
    result[i] = count
    count = 1
}
for element in result {
    print(element, terminator: " ")
}


