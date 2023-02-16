import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let temp = [[9,5,7,10,14,16,22,37,45,46],[8,1,2,3,5,8,13,21,34],[0]]
//let input = [7,1,2,3,4,5,6,7]
//while true {
//    if input[0] == 0 {
//        exit(0)
//    }
//    let k = input[0]; let numbers = input[1...input.count - 1]
////    var visited = Array(repeating: false, count: input.count)
//    func dfs(_ arr: [Int], _ idx: Int) {
//        if arr.count == 6 {
//            print(arr.map { String($0) }.joined(separator: " "))
//            return
//        }
//        for i in idx..<numbers.count {
////            if !visited[i] {
////                visited[i] = true
////            }
//            dfs(arr + [numbers[i]], i)
//        }
//    }
//    print("\n")
//}
for i in 0..<temp.count {
    let input = temp[i]
    if input[0] == 0 {
        break
    }
    let k = input[0]; let numbers = Array(input[1...input.count - 1])
    func dfs(_ arr: [Int], _ idx: Int) {
        if arr.count == 6 {
            print(arr.map { String($0) }.joined(separator: " "))
            return
        }
        for i in idx..<numbers.count {
            dfs(arr + [numbers[i]], i+1)
        }
    }
    dfs([], 0)
    print("")
}
