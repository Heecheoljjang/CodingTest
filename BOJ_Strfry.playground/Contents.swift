import Foundation

let n = Int(readLine()!)!
for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ")
    let first = input[0].map { String($0) }.sorted(by: <)
    let second = input[1].map { String($0) }.sorted(by: <)
    if first == second {
        print("Possible")
    } else {
        print("Impossible")
    }
}
