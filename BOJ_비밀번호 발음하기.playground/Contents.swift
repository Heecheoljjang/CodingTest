while true {
    let password: String = "houctuh"
    let vowel: [Character] = ["a", "e", "i", "o", "u"]
    let cons: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
    var temp: String = ""
    var voCount: Int = 0
    var conCount: Int = 0
    
    if password == "end" { // 마지막
        break
    }
    //모음을 하나도 포함하지 않는 경우
    if !password.contains("a") && !password.contains("e") && !password.contains("i") && !password.contains("o") && !password.contains("u") {
        print("<\(password)> is not acceptable.") //1번 조건을 만족하지 않은 경우
        continue // 제출할때 continue로 바꾸기
    }
    for char in password {
        if temp.isEmpty { //temp가 비어있는 경우
            temp.append(char)
        } else {
            if temp.last == char { //3번 조건 확인
                if char == "e" || char == "o" {
                    temp.append(char)
                } else { //같은 글자가 연속으로 온 경우
                    print("<\(password)> is not acceptable.")
                    temp = ""
                    break
                }
            }
            //2번 조건 확인
            if vowel.contains(temp.last!) { //이전에 들어온 값이 모음인 경우
                if vowel.contains(char) { //모음이 연속해서 들어온 경우
                    voCount += 1
                    if voCount == 2 {
                        print("<\(password)> is not acceptable.")
                        temp = ""
                        break
                    }
                } else { //모음 다음에 자음이 들어온 경우
                    voCount = 0
                    temp.append(char)
                }
            } else if cons.contains(temp.last!) { //이전에 들어온 값이 자음인 경우
                if cons.contains(char) { //자음이 연속해서 들어온 경우
                    conCount += 1
                    if conCount == 2{
                        print("<\(password)> is not acceptable.")
                        temp = ""
                        break
                    }
                } else { //자음 다음에 모음이 들어온 경우
                    conCount = 0
                    temp.append(char)
                }
            }
        }
    }
    if !temp.isEmpty {
        print("<\(password)> is acceptable.")
    }
}
