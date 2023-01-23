import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let students = readLine()!.split(separator: " ").map { Int(String($0))! }
    var check = Array(repeating: false, count: n + 1)
    var result = 0
    func dfs(_ arr: [Int]) {
        if check[students[arr.last! - 1]] {
            if arr.last! == students[arr.last! - 1] {
                result += arr.count - 1
            } else {
                if arr.contains(students[arr.last! - 1]) {
                    result += arr.firstIndex(of: students[arr.last! - 1])!
                } else {
                    result += arr.count
                }
            }
            return
        }
        check[students[arr.last! - 1]] = true
        dfs(arr + [students[arr.last! - 1]])
    }
    for i in 1...students.count {
        if !check[i] {
            if check[students[i - 1]] {
                result += 1
                check[i] = true
                continue
            }
            check[i] = true
            dfs([i])
        }
    }
    print(result)
}
