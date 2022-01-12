import Foundation

func solution(_ s: String) -> Int {
    
    var arr: String = s
    
    if arr.contains("one") {
        arr = arr.replacingOccurrences(of: "one", with: "1")
    } else if arr.contains("two") {
        arr = arr.replacingOccurrences(of: "two", with: "2")
    } else if arr.contains("three") {
        arr = arr.replacingOccurrences(of: "three", with: "3")
    } else if arr.contains("four") {
        arr = arr.replacingOccurrences(of: "four", with: "4")
    } else if arr.contains("five") {
        arr = arr.replacingOccurrences(of: "five", with: "5")
    } else if arr.contains("six") {
        arr = arr.replacingOccurrences(of: "six", with: "6")
    } else if arr.contains("seven") {
        arr = arr.replacingOccurrences(of: "seven", with: "7")
    } else if arr.contains("eight") {
        arr = arr.replacingOccurrences(of: "eight", with: "8")
    } else if arr.contains("nine") {
        arr = arr.replacingOccurrences(of: "nine", with: "9")
    } else if arr.contains("zero") {
        arr = arr.replacingOccurrences(of: "zero", with: "0")
    }
    return Int(arr)!
}

solution("one2three4")
