import Foundation

let alphabet = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
var input = readLine()!
for i in alphabet {
    input = input.replacingOccurrences(of: i, with: ".")
}
print(input.count)

//let word: String = "dz"
//var count: Int = 0
//var temp: String = ""
//var arr: [String] = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z=" ]
//
//for char in word {
//    if temp.isEmpty {
//        if char == "c" || char == "d" || char == "l" || char == "n" || char == "s" || char == "z" {
//            temp.append(char)
//        } else {
//            count += 1
//        }
//    } else {
//        temp.append(char) // count가 2인 상태
//        if temp.first != "d" {
//            if arr.contains(temp) {
//                count += 1
//                temp = ""
//            } else {
//                if char == "c" || char == "d" || char == "l" || char == "n" || char == "s" || char == "z"  {
//                    count += 1
//                    temp.removeFirst()
//                } else {
//                    count += 2
//                    temp = ""
//                }
//            }
//        } else { //temp의 맨 앞이 d인 경우
//            if arr.contains(temp) { //dz=, d-인 경우
//                count += 1
//                temp = ""
//            } else {
//                if temp == "dz" {
//                    continue
//                } else {
//                    if temp.count == 3 { //dz? 인 경우
//                        if char == "c" || char == "d" || char == "l" || char == "n" || char == "s" || char == "z"  {
//                            count += 2
//                            temp.removeFirst()
//                            temp.removeFirst()
//                        } else {
//                            count += 3
//                            temp = ""
//                        }
//                    } else { // d? 인 경우
//                        if char == "c" || char == "d" || char == "l" || char == "n" || char == "s" || char == "z"  {
//                            count += 1
//                            temp.removeFirst()
//                        } else {
//                            count += 2
//                            temp = ""
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//if !temp.isEmpty {
//    count += temp.count
//}
//print(count)
