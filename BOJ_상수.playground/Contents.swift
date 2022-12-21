import Foundation

let input = readLine()!.components(separatedBy: " ")
let first = String(input[0].reversed())
let second = String(input[1].reversed())
Int(first)! > Int(second)! ? print(first) : print(second)
