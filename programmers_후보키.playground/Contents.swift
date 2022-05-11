import Foundation

func solution(_ relation:[[String]]) -> Int {

    var key: [[String]] = []
    var temp: [String] = []
    var result: [String] = []
    var final: [[String]] = []
    var tempStr: String = ""
    var count: Int = 0

    // 조합을 이용해 먼저 모든 후보 키 경우의 수를 구한다.
    func combi(_ target: [String], _ targetNum: Int, _ index: Int, _ arr: [String]) {
        if arr.count == targetNum {
            key.append(arr)
            return
        }
        for i in index..<target.count {
            combi(target, targetNum, i+1, arr + [target[i]])
        }
    }
    // 아래의 두 반복문을 통해 모든 경우의 수 key에 넣음
    for i in 0..<relation[0].count {
        temp.append(String(i))
    }
    for i in 1...relation[0].count {
        combi(temp, i, 0, [])
    }
    // 원소가 적은 순으로 정렬
    // 작은 것부터 해야 두 번 지울 일이 없기 때문
    key = key.sorted { $0.count < $1.count }
    print("key: \(key)")
    while count < key.count {
        let i = key[count]
        for j in relation {
            //각 relation 키 구하기
            for k in i {
                tempStr += j[Int(k)!]
            }
            result.append(tempStr)
            tempStr = ""
        }
        // count가 다를 경우에는 중복되는 것이 있는 경우임.
        if result.sorted(by: <).count == Array(Set(result.sorted(by: <))).count {
            final.append(i)
        outer: for l in key {
            // 각각 나눠서 따져줘야함.
            for element in i {
                if l.contains(element) {
                    continue
                } else {
                    continue outer
                }
            }
            key.remove(at: key.firstIndex(of: l)!)
        }
            count = 0
        } else {
            count += 1
        }
        result = []
    }
    return final.count
}

solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])



