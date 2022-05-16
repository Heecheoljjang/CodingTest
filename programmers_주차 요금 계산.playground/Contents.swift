import Foundation

// 기본시간, 기본요금, 단위 시간, 단위 요금
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    var data: [String: Int] = [:]
    var result: [Int] = []
    
    for i in records {
        let time = String(i.split(separator: " ")[0])
        let number = String(i.split(separator: " ")[1])
        let inOut = String(i.split(separator: " ")[2])
        
        //분으로 환산한 시간
        let newTime: Int = Int(time.split(separator: ":")[0])! * 60 + Int(time.split(separator: ":")[1])!
        
        //In인 경우 -로, Out인 경우 +해주면 총 시간 나옴
        if inOut == "IN" {
            //이미 데이터가 있는 경우와 없는 경우를 나눠서 생각
            if data[number] == nil {
                data.updateValue(-newTime, forKey: number)
            } else {
                data.updateValue(data[number]! - newTime, forKey: number)
            }
        } else {
            // Out인 경우는 이미 해당 키에 대한 데이터가 존재함
            data.updateValue(data[number]! + newTime, forKey: number)
        }
    }
    // 요금 계산을 하는데 시간이 - 인 값들은 23:59분에 출차처리를 한 뒤 계산
    for i in data.keys {
        // - 인 경우
        if data[i]! <= 0 {
            let time: Int = data[i]! + 1439 // 23:59에 출차처리
            if time <= fees[0] { // 기본 시간 초과했는지 확인
                data.updateValue(fees[1], forKey: i)
            } else {
                data.updateValue(fees[1] + Int(ceil(Double(time - fees[0]) / Double(fees[2]))) * fees[3], forKey: i)
            }
        } else {
            let time: Int = data[i]!
            if time <= fees[0] { // 기본 시간 초과했는지 확인
                data.updateValue(fees[1], forKey: i)
            } else {
                data.updateValue(fees[1] + Int(ceil(Double(data[i]! - fees[0]) / Double(fees[2]))) * fees[3], forKey: i)
            }
        }
    }
    for i in data.keys.sorted(by: <) {
        result.append(data[i]!)
    }
    return result
}
solution([1, 461, 1, 10], ["00:00 1234 IN"])
