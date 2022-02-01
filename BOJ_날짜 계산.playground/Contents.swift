import Foundation

let str: String = readLine()!
var esm = [Int](repeating: 0, count: 3)
var year: Int = 0

for i in 0..<3 {
    esm[i] = Int(str.components(separatedBy: " ")[i])!
}
if esm[0] == 15 && esm[1] == 28 && esm[2] == 19 {
    year = 7980
} else if esm[0] == 15 && esm[1] == 28 && esm[2] != 19 {
    year = 420 // 15 * 28
    while year % 19 != esm[2] {
        year += 420
    }
} else if esm[0] == 15 && esm[1] != 28 && esm[2] == 19 {
    year = 285
    while year % 28 != esm[1] {
        year += 285
    }
} else if esm[0] != 15 && esm[1] == 28 && esm[2] == 19 {
    year = 532
    while year % 15 != esm[0] {
        year += 532
    }
} else if esm[0] == 15 && esm[1] != 28 && esm[2] != 19 {
    year = 15
    while true {
        if year % 28 == esm[1] && year % 19 == esm[2] {
            break
        } else {
            year += 15
        }
    }
} else if esm[0] != 15 && esm[1] == 28 && esm[2] != 19 {
    year = 28
    while true {
        if year % 15 == esm[0] && year % 19 == esm[2] {
            break
        } else {
            year += 28
        }
    }
} else if esm[0] != 15 && esm[1] != 28 && esm[2] == 19 {
    year = 19
    while true {
        if year % 15 == esm[0] && year % 28 == esm[1] {
            break
        } else {
            year += 19
        }
    }
} else {
    year = esm[1] // 가장 큰 걸로 설정
    while true {
        if year % 15 == esm[0] && year % 19 == esm[2] {
            break
        } else {
            year += 28
        }
    }
}
print(year)
