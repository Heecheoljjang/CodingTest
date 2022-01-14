import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    
    var pass: [Int] = []//스테이지에 도달한 사람의 수
    var fail: [Int] = [] //도달했지만 스테이지를 실패한 사람의 수
    var doubleRate: [Double] = [] //단계별 실패율을 요소로 갖는 배열
    var rate: [Int] = []
    
    for i in 0..<N {
        pass.append(stages.filter{$0 >= (i + 1)}.count)
        fail.append(stages.filter{$0 == (i + 1)}.count)
        
        doubleRate.append(Double(fail[i]) / Double(pass[i])) //각 스테이지의 실패율
    }
    for i in 0..<N {
        //rate에 실패율이 높은 순서대로 (인덱스 + 1)을 넣어줘서 리턴해야함
        rate.append(doubleRate.firstIndex(of: doubleRate.sorted{$0 > $1}[i])! + 1)
        
    }
    print(pass)
    print(fail)
    print(doubleRate)
    return rate
}
solution(5, [2,1,2,6,2,4,3,3])
