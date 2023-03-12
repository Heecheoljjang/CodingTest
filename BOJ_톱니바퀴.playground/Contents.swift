import Foundation

//var input: [[String]] = []
//for _ in 0..<3 {
//    input.append(readLine()!.map { String($0) })
//}
//var count = Int(readLine()!)!
var input = [["1","0","0","1","0","0","1","1"],
             ["0","1","0","1","0","0","1","1"],
             ["1","1","1","0","0","0","1","1"],
             ["0","1","0","1","0","1","0","1"]]
//var count = 8
//var data: [[Int]] = []
var data = [[1,1],[2,1],[3,1],[4,1],[1,-1],[2,-1],[3,-1],[4,-1]]
private func changeLeft(_ gear: [String], _ num: Int) {
    print("left로 바꾸기 이전: \(gear)")
    var new = gear
    let first = new[0]
    for i in 0..<gear.count - 1 {
        new[i] = new[i + 1]
    }
    new[7] = first
    print("left 이후: \(new)")
    input[num] = new
}
private func changeRight(_ gear: [String], _ num: Int){
    print("right 이전: \(gear)")
    var new = gear
    let last = new[7]
    for i in stride(from: 7, through: 1, by: -1) {
        new[i] = new[i - 1]
    }
    new[0] = last
    print("right 이후: \(new)")
    input[num] = new
}
private func getGearDir(_ first: Int, _ dir: Int) -> [Int] {
    if first % 2 == 0 {
        return [-dir,dir,-dir,dir]
    } else {
        return [dir,-dir,dir,-dir]
    }
}
private func getChangingGear(_ first: Int) -> [Int] {
    if first == 1 {
        //두번째꺼확인하면됨
        if input[0][2] == input[1][6] {
            //같으면 안돌아감 여기서 끝
            return [1]
        } else {
            //다르면 다시 두번째꺼랑 세번째꺼 비교해야함
            if input[1][2] == input[2][6] {
                return [1,2]
            } else {
                if input[2][2] == input[3][6] {
                    return [1,2,3]
                } else {
                    return [1,2,3,4]
                }
            }
        }
    } else if first == 2 {
        if input[0][2] == input[1][6] {
            if input[1][2] == input[2][6] {
                return [2]
            } else {
                if input[2][2] == input[3][6] {
                    return [2,3]
                } else {
                    return [2,3,4]
                }
            }
        } else {
            if input[1][2] == input[2][6] {
                return [1,2]
            } else {
                if input[2][2] == input[3][6] {
                    return [1,2,3]
                } else {
                    return [1,2,3,4]
                }
            }
        }
    } else if first == 3 {
        if input[2][2] == input[3][6] {
            if input[1][2] == input[2][6] {
                return [3]
            } else {
                if input[0][2] == input[1][6] {
                    return [2,3]
                } else {
                    return [1,2,3]
                }
            }
        } else {
            if input[1][2] == input[2][6] {
                return [3,4]
            } else {
                if input[0][2] == input[1][6] {
                    return [2,3,4]
                } else {
                    return [1,2,3,4]
                }
            }
         }
    } else {
        //두번째꺼확인하면됨
        if input[2][2] == input[3][6] {
            //같으면 안돌아감 여기서 끝
            return [4]
        } else {
            //다르면 다시 두번째꺼랑 세번째꺼 비교해야함
            if input[1][2] == input[2][6] {
                return [3,4]
            } else {
                if input[0][2] == input[1][6] {
                    return [2,3,4]
                } else {
                    return [1,2,3,4]
                }
            }
        }
    }
}
//for _ in 0..<count {
//    data.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
for i in 0..<data.count {
    let cur = data[i]
    let dir = getGearDir(cur[0],cur[1]) //방향
    let gears = getChangingGear(cur[0]) //바뀌는 기어들
    print(cur, dir, gears)
    for gear in gears {
        print("현재 바퀴: \(gear)")
        if dir[gear - 1] == 1 {
            changeRight(input[gear-1], gear - 1)
        } else {
            changeLeft(input[gear-1], gear - 1)
        }
    }
    print("=================바뀐 후")
    print(input)
    print("========================")
}
var result = 0
for i in 0..<4 {
    if input[i][0] == "1" {
        switch i {
            case 0:
            result += 1
            case 1:
            result += 2
            case 2:
            result += 4
            default:
            result += 8
        }
    }
}
print(result)
