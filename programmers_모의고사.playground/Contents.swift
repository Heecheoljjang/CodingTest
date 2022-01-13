import Foundation

func solution(_ answers:[Int]) -> [Int] {

    let first: [Int] = [1,2,3,4,5]
    let second: [Int] = [2,1,2,3,2,4,2,5]
    let third: [Int] = [3,3,1,1,2,2,4,4,5,5]

    var arr1: [Int] = []
    var arr2: [Int] = []
    var arr3: [Int] = []

    var count: [Int] = [0,0,0]

    for i in 0..<answers.count {
        arr1.append(first[(i % first.count)])
        arr2.append(second[(i % second.count)])
        arr3.append(third[(i % third.count)])

        if answers[i] == arr1[i] {
            count[0] += 1
        }
        if answers[i] == arr2[i] {
            count[1] += 1
        }
        if answers[i] == arr3[i] {
            count[2] += 1
        }
    }
    if count.firstIndex(of: count.max()!)! != count.lastIndex(of: count.max()!)! { //1등이 두 명 이상일 경우
        if count[0] == count [1] && count[1] == count[2] {
            return [1,2,3]
        } else {
            return [count.firstIndex(of: count.max()!)! + 1, count.lastIndex(of: count.max()!)! + 1]
        }
    } else {
        return [count.firstIndex(of: count.max()!)! + 1]
    }
}
solution([1,3,2,4,2])

