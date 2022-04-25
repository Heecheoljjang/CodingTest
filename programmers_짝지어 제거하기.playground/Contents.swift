import Foundation

func solution(_ s:String) -> Int{
    
    let arr = Array(s)
    var answer:Int = -1
    var temp: [Character] = []

    for i in 0..<arr.count {
        if temp.count == 0 {
            temp.append(arr[i])
        } else {
            if temp.last! == arr[i] {
                temp.removeLast()
            } else {
                temp.append(arr[i])
            }
        }
    }
    if temp.count == 0 {
        answer = 1
    } else {
        answer = 0
    }
    return answer
}
solution("122133")
