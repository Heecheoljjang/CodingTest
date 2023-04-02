import Foundation

//let n = Int(readLine()!)!
//var balls: [(Int,Int)] = []
//for i in 0..<n {
//    balls.append((Int(readLine()!)!, Int(readLine()!)!,i))
//}
let n = 3
var balls = [(1,4,0),(2,4,1),(1,4,2)]
balls.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    }
    return $0.1 < $1.1
}
var sizeDic: [Int: Int] = [:]
var colorDic: [Int:Int] = [:]
var cur = 0 //누적된 공 크기 합
var result = Array(repeating: 0, count: n)
print("balls", balls)
for i in 0..<balls.count {
    //지금까지의 합에서 자기크기 합 뺴기
    //[0]: 색, [1]: 크기, [2]: 실제 순서. 즉, result에 들어갈순서
    //자기는 포함 x
    print(balls[i])
    var temp = cur
    
    //1. dic에 값 더해주기. dic[사이즈] = 개수
    if sizeDic[balls[i].1] == nil {
        sizeDic[balls[i].1] = 1
    } else {
        sizeDic[balls[i].1]! += 1
    }
    if colorDic[balls[i].0] == nil {
        colorDic[balls[i].0] = balls[i].1
    } else {
        colorDic[balls[i].0]! += balls[i].1
    }
    print(sizeDic, colorDic, cur)
    //2. 지금까지의 합에서 자기값빼기. 지금까지의 합. 이전이랑 아예 같으면 그대로
    if i != 0 && balls[i].0 == balls[i - 1].0 && balls[i].1 == balls[i - 1].1 {
        result[balls[i].2] = result[balls[i - 1].2]
        cur += balls[i].1
        continue
    }
    print("temp시", temp)
    temp -= (sizeDic[balls[i].1]! - 1) * balls[i].1
    print("temp중",temp)
    temp -= colorDic[balls[i].0]! - balls[i].1
    print("temp끝", temp)
    result[balls[i].2] = temp
    print("result", result)
    cur += balls[i].1
}
for i in 0..<result.count {
    print(result[i])
}
