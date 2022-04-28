//import Foundation
//
//func solution(_ places:[[String]]) -> [Int] {
//
//    var result: [Int] = []
//    // for문을 이용할 것이므로 오른쪽 / 아래로 맨해튼 거리가 2 이하인 경우를 전부 확인해보기로함
//    func check(_ roomArr: [String]) -> Int {
//        // 인덱스 0~2까지는 인덱스 +2 를 해도 range를 벗어나지 않으므로 먼저 계산 후 나머지는 따로 계산
//        // 맨해튼 거리 안에 다른 P가 있는지 확인
//        for i in 0...2 {
//            for j in 0...2 {
//                // 바로 옆, 바로 아래, 옆옆, 아래아래, 대각선에 p가 있는지 확인하고 옆옆이나 아래아래 같은 경우엔 사이에 X가 있는 지 확인
//                if Array(roomArr[i])[j] == "P" {
//                    if Array(roomArr[i])[j+1] == "P" { // 바로 옆
//                        return 0
//                    } else if Array(roomArr[i])[j+2] == "P" { // 옆옆
//                        if Array(roomArr[i])[j+1] == "O" {
//                            return 0
//                        }
//                    } else if Array(roomArr[i+1])[j] == "P" { // 아래
//                        return 0
//                    } else if Array(roomArr[i+2])[j] == "P" { // 아래아래
//                        if Array(roomArr[i+1])[j] == "O" {
//                            return 0
//                        }
//                    } else if Array(roomArr[i+1])[j+1] == "P" { // 대각선
//                        if Array(roomArr[i])[j+1] == "O" || Array(roomArr[i+1])[j] == "O" {
//                            return 0
//                        }
//                    }
//                }
//            }
//        }
//        // 나머지
//        for i in 3...4 {
//            if i == 3 {
//                for j in 0...2 {
//                    // 바로 오른쪽과 아래, 아래아래, 대각선만 확인하면됨
//                    if Array(roomArr[i])[j] == "P" {
//                        if Array(roomArr[i+1])[j] == "P" { //바로 오른쪽
//                            return 0
//                        } else if Array(roomArr[i])[j+1] == "P" { // 아래
//                            return 0
//                        } else if Array(roomArr[i])[j+2] == "P" { // 아래아래
//                            if Array(roomArr[i])[j+1] == "O" {
//                                return 0
//                            }
//                        } else if Array(roomArr[i+1])[j+1] == "P" { // 대각선
//                            if Array(roomArr[i])[j+1] == "O" || Array(roomArr[i+1])[j] == "O" {
//                                return 0
//                            }
//                        }
//                    }
//                }
//            } else { //i가 4인 경우엔 아래와 아래아래만 확인하면됨
//                for j in 0...2 {
//                    if Array(roomArr[i])[j] == "P" {
//                        if Array(roomArr[i])[j+1] == "P" {
//                            return 0
//                        } else if Array(roomArr[i])[j+2] == "P" {
//                            if Array(roomArr[i])[j+1] == "O" {
//                                return 0
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        // 반대의 경우도 해줌
//        for j in 3...4 {
//            if j == 3 {
//                for i in 0...2 {
//                    // 바로 오른쪽과 아래, 옆옆, 대각선만 확인하면됨
//                    if Array(roomArr[i])[j] == "P" {
//                        if Array(roomArr[i+1])[j] == "P" { //바로 오른쪽
//                            return 0
//                        } else if Array(roomArr[i])[j+1] == "P" { // 아래
//                            return 0
//                        } else if Array(roomArr[i+2])[j] == "P" { // 옆옆
//                            if Array(roomArr[i+1])[j] == "O" {
//                                return 0
//                            }
//                        } else if Array(roomArr[i+1])[j+1] == "P" { // 대각선
//                            if Array(roomArr[i])[j+1] == "O" || Array(roomArr[i+1])[j] == "O" {
//                                return 0
//                            }
//                        }
//                    }
//                }
//            } else { //j가 4인 경우엔 옆과 옆옆만 확인하면됨
//                for i in 0...2 {
//                    if Array(roomArr[i])[j] == "P" {
//                        if Array(roomArr[i+1])[j] == "P" {
//                            return 0
//                        } else if Array(roomArr[i+2])[j] == "P" {
//                            if Array(roomArr[i+1])[j] == "O" {
//                                return 0
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        // "/" 모양 대각선 빠져서 확인
//        for i in 1...4 {
//            for j in 0...3 {
//                if Array(roomArr[i])[j] == "P" {
//                    if Array(roomArr[i-1])[j+1] == "P" {
//                        if Array(roomArr[i])[j+1] == "O" || Array(roomArr[i-1])[j] == "O" {
//                            return 0
//                        }
//                    }
//                }
//            }
//        }
//        return 1
//    }
//
//    for i in 0..<5 {
//        result.append(check(places[i]))
//    }
//    return result
//}
//solution([["OOPOO", "OPOOO", "OOOOO", "OOOOO", "OOOOO"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])
////왼쪽 아래 대각선도 확인해야됨


import Foundation

func solution(_ places:[[String]]) -> [Int] {

    var location: [[Int]: String] = [:]
    var result: [Int] = []
    var resultTemp: Int = 1
    
    // 대기실의 모든 점의 좌표 딕셔너리로 구하는 함수
    func getLocation(_ room: [String]) {
        for i in 0...4 {
            for j in 0...4 {
                location.updateValue(String(Array(room[i])[j]), forKey: [i,j])
            }
        }
    }
    
    // 체크함수
    
    for i in 0...4 {
        // 값이 P인 좌표 구함
        getLocation(places[i])
        print(places[i])
        let pLocation = Array(location.filter {$0.value == "P"}) //딕셔너리는 순서가 없고 인덱스로 접근할 수 없으므로 배열로 캐스팅
        print(pLocation)
        
        // 서로 다른 두 P의 맨해튼 거리 계산
    outerLoop: for j in 0..<pLocation.count {
            let temp = pLocation[j]
            for k in j+1..<pLocation.count {
                // 두 P의 맨해튼 거리 게산
                // 1인 경우엔 거리두기 안함 / 2인 경우엔 x값 같을경우, y값 같을 경우, 두 값 모두 다를 때 파티션이 있는 지 확인
                print("temp: \(temp), else: \(pLocation[k])")
                if abs(temp.key[0] - pLocation[k].key[0]) + abs(temp.key[1] - pLocation[k].key[1]) == 1 {
                    //result.append(0)
                    resultTemp = 0
                    break outerLoop
                } else if abs(temp.key[0] - pLocation[k].key[0]) + abs(temp.key[1] - pLocation[k].key[1]) == 2 {
                    // x가 같은 경우
                    if temp.key[0] == pLocation[k].key[0] {
                        if temp.key[1] > pLocation[k].key[1] {
                            //plocation[k]의 좌표를 이용해 사이 값이 "X"인지 확인
                            let xPosition: Int = pLocation[k].key[0]
                            let yPosition: Int = pLocation[k].key[1] + 1
                            if location[[xPosition, yPosition]] != "X" {
                                //result.append(0)
                                resultTemp = 0
                                break outerLoop
                            }
                        } else {
                            let xPosition: Int = pLocation[k].key[0]
                            let yPosition: Int = pLocation[k].key[1] - 1
                            if location[[xPosition, yPosition]] != "X" {
                                //result.append(0)
                                resultTemp = 0
                                break outerLoop
                            }
                        }
                    } else if temp.key[1] == pLocation[k].key[1] { //y가 같은 경우
                        if temp.key[0] > pLocation[k].key[0] {
                            //plocation[k]의 좌표를 이용해 사이 값이 "X"인지 확인
                            let xPosition: Int = pLocation[k].key[0] + 1
                            let yPosition: Int = pLocation[k].key[1]
                            if location[[xPosition, yPosition]] != "X" {
                                //result.append(0)
                                resultTemp = 0
                                break outerLoop
                            }
                        } else {
                            let xPosition: Int = pLocation[k].key[0] - 1
                            let yPosition: Int = pLocation[k].key[1]
                            if location[[xPosition, yPosition]] != "X" {
                                //result.append(0)
                                resultTemp = 0
                                break outerLoop
                            }
                        }
                    } else { // x,y 모두 다를 경우 -> 대각선
                        // x좌표가 더 큰 값의 y좌표가 작은 경우 / 모양, x좌표가 더 큰 값의 좌표가 y좌표도 큰 경우엔 \ 모양
                        if temp.key[0] > pLocation[k].key[0] {
                            // "/" 모양 대각선이고 temp가 오른쪽 위에 위치
                            if temp.key[1] < pLocation[k].key[1] {
                                let xPosition: Int = pLocation[k].key[0]
                                let yPosition: Int = pLocation[k].key[1]
                                if location[[xPosition, yPosition - 1]] != "X" || location[[xPosition + 1, yPosition]] != "X" {
                                    //result.append(0)
                                    resultTemp = 0
                                    break outerLoop
                                }
                            } else { // 반대 모양
                                let xPosition: Int = pLocation[k].key[0]
                                let yPosition: Int = pLocation[k].key[1]
                                if location[[xPosition + 1, yPosition]] != "X" || location[[xPosition, yPosition + 1]] != "X" {
                                    //result.append(0)
                                    resultTemp = 0
                                    break outerLoop
                                }
                            }
                        } else {
                            // "\" 모양 대각선이고 temp가 왼쪽 위에 위치
                            if temp.key[1] < pLocation[k].key[1] {
                                let xPosition: Int = pLocation[k].key[0]
                                let yPosition: Int = pLocation[k].key[1]
                                if location[[xPosition - 1 , yPosition]] != "X" || location[[xPosition, yPosition - 1]] != "X" {
                                    //result.append(0)
                                    resultTemp = 0
                                    break outerLoop
                                }
                            } else { // 반대 모양
                                let xPosition: Int = pLocation[k].key[0]
                                let yPosition: Int = pLocation[k].key[1]
                                if location[[xPosition - 1, yPosition]] != "X" || location[[xPosition, yPosition + 1]] != "X" {
                                    //result.append(0)
                                    resultTemp = 0
                                    break outerLoop
                                }
                            }
                        }
                    }
                }
            }
        }
        result.append(resultTemp)
        resultTemp = 1
    }
    return result
}

solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])
