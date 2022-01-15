import Foundation
//
//5, 9, 22 시간초과
//
//func solution(_ N: Int, _ stages: [Int]) -> [Int] {
//
//    var pass: [Int] = []//스테이지에 도달한 사람의 수
//    var fail: [Int] = [] //도달했지만 스테이지를 실패한 사람의 수
//    var doubleRate: [Double] = [] //단계별 실패율을 요소로 갖는 배열
//    var rate: [Int] = []
//
//    for i in 0..<N {
//        pass.append(stages.filter{$0 >= (i + 1)}.count)
//        fail.append(stages.filter{$0 == (i + 1)}.count)
//
//        if pass[i] != 0 {
//            doubleRate.append(Double(fail[i]) / Double(pass[i])) //각 스테이지의 실패율
//        } else {
//            doubleRate.append(0.0)
//        }
//    }
//    for i in 0..<N {
//        //rate에 실패율이 높은 순서대로 (인덱스 + 1)을 넣어줘서 리턴해야함
//        rate.append(doubleRate.firstIndex(of: doubleRate.sorted{$0 > $1}[i])! + 1)
//        doubleRate[doubleRate.firstIndex(of: doubleRate.sorted{$0 > $1}[i])!] = 2
//    }
//    return rate
//}
//solution(5, [2,2,2,2,2])


//다른 분들의 답을 참고해서 이해하면서 해결함
func solution(_ N: Int, _ stages: [Int]) -> [Int] {

    var rate: [Int: Double] = [:]
    var fail = [Int](repeating: 0, count: N + 1)

    for i in stages {
        for j in 0..<i {
            fail[j] += 1
        }
    }
    for i in 0..<N {
        rate.updateValue(Double(fail[i] - fail[i+1]) / Double(fail[i]), forKey: i + 1)
    }

    return rate.sorted {$0.key < $1.key}.sorted{$0.value > $1.value}.map{$0.key}
}
solution(5, [2,1,2,6,2,4,3,3])

