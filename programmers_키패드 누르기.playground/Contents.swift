import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var result: String = ""
    var leftLocation: [Int] = [0,0]// 두 개의 요소로 좌표를 나타내도록 했음 [0] -> x좌표, [1] -> y좌표
    var rightLocation: [Int] = [2,0]
    
    for i in numbers {
        if i == 1 || i == 4 || i == 7 {
            switch i {
            case 1:
                result.append("L")
                leftLocation = [0, 3]
            case 4:
                result.append("L")
                leftLocation = [0, 2]
            case 7:
                result.append("L")
                leftLocation = [0, 1]
            default:
                break
            }
        } else if i == 3 || i == 6 || i == 9 {
            switch i {
            case 3:
                result.append("R")
                rightLocation = [2, 3]
            case 6:
                result.append("R")
                rightLocation = [2, 2]
            case 9:
                result.append("R")
                rightLocation = [2, 1]
            default:
                break
            }
        } else {    // i 가 2, 5, 8, 0인 경우
            switch i {
            case 2: // [1,3]
                if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 3) > abs(rightLocation[0] - 1) + abs(rightLocation[1] - 3) {
                    result.append("R")
                    rightLocation = [1, 3]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 3) < abs(rightLocation[0] - 1) + abs(rightLocation[1] - 3){
                    result.append("L")
                    leftLocation = [1, 3]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 3) == abs(rightLocation[0] - 1) + abs(rightLocation[1] - 3){
                    if hand == "right" {
                        result.append("R")
                        rightLocation = [1, 3]
                    } else {
                        result.append("L")
                        leftLocation = [1, 3]
                    }
                }
            case 5: // [1,2]
                if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 2) > abs(rightLocation[0] - 1) + abs(rightLocation[1] - 2) {
                    result.append("R")
                    rightLocation = [1, 2]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 2) < abs(rightLocation[0] - 1) + abs(rightLocation[1] - 2) {
                    result.append("L")
                    leftLocation = [1, 2]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 2) == abs(rightLocation[0] - 1) + abs(rightLocation[1] - 2){
                    if hand == "right" {
                        result.append("R")
                        rightLocation = [1, 2]
                    } else {
                        result.append("L")
                        leftLocation = [1, 2]
                    }
                }
            case 8: // [1,1]
                if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 1) > abs(rightLocation[0] - 1) + abs(rightLocation[1] - 1) {
                    result.append("R")
                    rightLocation = [1, 1]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 1) < abs(rightLocation[0] - 1) + abs(rightLocation[1] - 1) {
                    result.append("L")
                    leftLocation = [1, 1]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1] - 1) == abs(rightLocation[0] - 1) + abs(rightLocation[1] - 1){
                    if hand == "right" {
                        result.append("R")
                        rightLocation = [1, 1]
                    } else {
                        result.append("L")
                        leftLocation = [1, 1]
                    }
                }
            case 0: // [1,0]
                if abs(leftLocation[0] - 1) + abs(leftLocation[1]) > abs(rightLocation[0] - 1) + abs(rightLocation[1]) {
                    result.append("R")
                    rightLocation = [1, 0]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1]) < abs(rightLocation[0] - 1) + abs(rightLocation[1]) {
                    result.append("L")
                    leftLocation = [1, 0]
                } else if abs(leftLocation[0] - 1) + abs(leftLocation[1]) == abs(rightLocation[0] - 1) + abs(rightLocation[1]){
                    if hand == "right" {
                        result.append("R")
                        rightLocation = [1, 0]
                    } else {
                        result.append("L")
                        leftLocation = [1, 0]
                    }
                }
            default:
                break
            }
        }
    }
    return result
}
