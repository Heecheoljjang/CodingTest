import Foundation

func solution(_ word:String) -> Int {
    let input = ["A", "E", "I", "O", "U"]
    var count = 1
    var allWords: [String] = []
    
    func dfs(_ arr: [String], _ targetNum: Int) {
        if arr.count == targetNum {
            allWords.append(arr.joined())
            return
        }
        for i in 0..<input.count {
            dfs(arr + [input[i]], targetNum)
        }
    }
    while count <= 5 {
        dfs([], count)
        count += 1
    }
    allWords.sort(by: <)
    return allWords.firstIndex(of: word)! + 1
}
