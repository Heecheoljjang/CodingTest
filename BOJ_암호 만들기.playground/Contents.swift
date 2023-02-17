import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [4,6]
let l = input[0]; let c = input[1]
let vowel = ["a","e","i","o","u"]
let con = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"]
//var list = readLine()!.split(separator: " ").map { String($0) }.sorted(by: <)
let list = ["a","t","c","i","s","w"].sorted(by: <)
var result: [[String]] = []
//한개의 모음과 두 개의 자음
func dfs(_ arr: [String], _ idx: Int) {
    if arr.count == l {
        if arr.filter { vowel.contains($0) }.count < 1 {
            return
        }
        if arr.filter { con.contains($0) }.count < 2 {
            return
        }
        print(arr.joined())
        return
    }
    for i in idx..<list.count {
        dfs(arr + [list[i]], i + 1)
    }
}
dfs([],0)
