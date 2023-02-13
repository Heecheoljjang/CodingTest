import Foundation

//func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
//
//    var del = deliveries
//    var pi = pickups
//    var result: Int64 = 0
//    var count = n - 1
//
//    while count >= 0 {
//        if del[count] == 0 && pi[count] == 0 {
//            count -= 1
//            continue
//        }
//        var tempDel = 0
//        var tempPick = 0
//        var tempCount = count
//        while tempCount >= 0 {
//            if tempDel == cap && tempPick == cap {
//                break
//            }
//            if tempDel != cap {
//                if del[tempCount] >= cap - tempDel {
//                    del[tempCount] -= cap - tempDel
//                    tempDel += cap - tempDel
//                } else {
//                    tempDel += del[tempCount]
//                    del[tempCount] = 0
//                }
//            }
//            if tempPick != cap {
//                if pi[tempCount] >= cap - tempPick {
//                    pi[tempCount] -= cap - tempPick
//                    tempPick += cap - tempPick
//                } else {
//                    tempPick += pi[tempCount]
//                    pi[tempCount] = 0
//                }
//            }
//            tempCount -= 1
//        }
//        result += Int64(count + 1) * 2
//    }
//    return result
//}

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    
    var result: Int64 = 0
    var del = 0
    var pick = 0
    
    for i in stride(from: n - 1, through: 0, by: -1) {
        print(i)
        del -= deliveries[i]
        pick -= pickups[i]
        print("이전 \(del) \(pick)")
        if del >= 0 && pick >= 0 {
            continue
        }
        let minValue = min(pick,del)
        print("max \(minValue)")
        var temp = 0
        if abs(minValue) % cap == 0 {
            temp = abs(minValue) / cap
        } else {
            temp = (abs(minValue) / cap) + 1
        }
        del += cap * temp
        pick += cap * temp
        print("이후 \(del) \(pick)")
        print("더할 값 \(Int64((i+1) * 2 * temp))")
        result += Int64((i+1) * 2 * temp)
        print("결과 \(result)")
    }
    return result
}

solution(2,3,[4,1,2],[1,1,0])
