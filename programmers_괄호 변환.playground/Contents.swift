import Foundation

func solution(_ p:String) -> String {
    
    var isComplete: Bool = true
    var u: String = ""
    var v: String = ""
    
    if p == "" {
        return ""
    }
    // 올바른지 확인하는 함수
    func checkComplete(_ u: String) {
        
        var left: Int = 0
        var right: Int = 0
        
        if u.first == ")" {
            isComplete = false
        }
        for i in u {
            if i == "(" {
                left += 1
            } else {
                right += 1
                if right > left {
                    isComplete = false
                }
            }
        }
        if u.last == "(" {
            isComplete = false
        }
    }
    // u,v 분리하는 함수
    func seperate(_ w: String) {
        var result: String = ""
        var left: Int = 0
        var right: Int = 0
        
        //u,v를 분리하고 u가 올바른지 아닌지 확인
        for i in 0..<Array(w).count {
            let index: String.Index = String.Index(utf16Offset: i, in: w)
            if w[index] == "(" {
                //print("left")
                left += 1
                result.append(w[index])
                //print("result: \(result)")
            } else {
                //print("right")
                right += 1              
                result.append(w[index])
//                print("result: \(result)")
            }
            if left != 0 && left == right {
                let nextIndex: String.Index = String.Index(utf16Offset: i + 1, in: w)
                u = result
                v = String(w[nextIndex...])
                checkComplete(u)
//                print("u: \(u), v: \(v)")
                break
            }
        }
    }
    seperate(p)
//    print("U: \(u)")
//    print(isComplete)
    if isComplete == true {
        //print("A")
        return u + solution(v)
    } else {
        //print("B")
        var answer = ""
        answer += "("
        answer += solution(v)
        answer += ")"
        
        // u의 첫번째와 마지막 제거하기
        if u == ")(" {
            return answer
        } else {
//            print("gogo")
            u = String(u[String.Index(utf16Offset: 1, in: u)..<String.Index(utf16Offset: u.count - 1, in: u)])
            for i in u {
                if i == "(" {
                    answer.append(")")
                } else {
                    answer.append("(")
                }
            }
            return answer
        }
    }
    return ""
}
solution("()))((()")
