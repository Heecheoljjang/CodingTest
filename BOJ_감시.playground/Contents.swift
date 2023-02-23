import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [1,7]
//var office: [[Int]] = []
var cctv = 0
//var office = [[0,0,0,0,0,0],
//              [0,0,0,0,0,0],
//              [0,0,1,0,6,0],
//              [0,0,0,0,0,0]]
var office = [[0,3,0,0,3,0,0]]

//for _ in 0..<input[0] {
//    office.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
var result = input[0] * input[1]
var initValue = input[0] * input[1]
for i in 0..<input[0] {
    for j in 0..<input[1] {
        if office[i][j] < 6 && office[i][j] >= 1 {
            cctv += 1
            initValue -= 1
        }
        if office[i][j] == 6 {
            initValue -= 1
        }
    }
}
//print("init", initValue)
/*
 방향
 1 오 2 아 3 왼 4 위
 */
let first = [[1],[2],[3],[4]]
let second = [[1,3],[2,4],[1,3],[2,4]]
let third = [[1,4],[1,2],[2,3],[3,4]]
let fourth = [[1,3,4],[1,2,4],[1,2,3],[2,3,4]]
let fifth = [[1,2,3,4],[1,2,3,4],[1,2,3,4],[1,2,3,4]]
var directions: [[Int]] = []

func permu(_ arr: [Int]) {
    if arr.count == cctv {
        directions.append(arr)
        return
    }
    for i in 1...4 {
        permu(arr + [i])
    }
}
permu([])
for dir in directions {
//    print(dir)
    var count = 0
    var tempOffice = office
    var tempResult = initValue
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if tempOffice[i][j] < 6 && tempOffice[i][j] >= 1 {
                let curDir = dir[count] - 1//현재 cctv 방향
                var tempSet: [Int] = []
                count += 1
                if tempOffice[i][j] == 1 {
                    tempSet = first[curDir]
                } else if tempOffice[i][j] == 2 {
                    tempSet = second[curDir]
                } else if tempOffice[i][j] == 3 {
                    tempSet = third[curDir]
                } else if tempOffice[i][j] == 4 {
                    tempSet = fourth[curDir]
                } else {
                    tempSet = fifth[curDir]
                }
//                print("tempSet", tempSet)
                for num in tempSet {
                    if num == 1 {
                        //오른쪽 다 바꾸기
                        //i는 같아야하고, j만 현재에서 1씩 증가
                        var tempJ = j + 1
                        while tempJ < input[1] {
                            if tempOffice[i][tempJ] == 0 {
                                tempOffice[i][tempJ] = -1
                                tempResult -= 1
                                tempJ += 1
                            } else if tempOffice[i][tempJ] == -1 || (tempOffice[i][tempJ] < 6 && tempOffice[i][tempJ] >= 1) {
                                tempJ += 1
                            } else {
                                break
                            }
                        }
                    } else if num == 2 {
                        //아래
                        var tempI = i + 1
                        while tempI < input[0] {
                            if tempOffice[tempI][j] == 0 {
                                tempOffice[tempI][j] = -1
                                tempResult -= 1
                                tempI += 1
                            } else if tempOffice[tempI][j] == -1 || (tempOffice[tempI][j] < 6 && tempOffice[tempI][j] >= 1) {
                                tempI += 1
                            } else {
                                break
                            }
                        }
                    } else if num == 3 {
                        //왼
                        var tempJ = j - 1
                        while tempJ >= 0 {
                            if tempOffice[i][tempJ] == 0 {
                                tempOffice[i][tempJ] = -1
                                tempResult -= 1
                                tempJ -= 1
                            } else if tempOffice[i][tempJ] == -1 || (tempOffice[i][tempJ] < 6 && tempOffice[i][tempJ] >= 1) {
                                tempJ -= 1
                            } else {
                                break
                            }
                        }
                    } else {
                        //위
                        var tempI = i - 1
                        while tempI >= 0 {
                            if tempOffice[tempI][j] == 0 {
                                tempOffice[tempI][j] = -1
                                tempResult -= 1
                                tempI -= 1
                            } else if tempOffice[tempI][j] == -1  || (tempOffice[tempI][j] < 6 && tempOffice[tempI][j] >= 1) {
                                tempI -= 1
                            } else {
                                break
                            }
                        }
                    }
                }
            }
        }
    }
//    print("tempOffice")
//    print(tempOffice)
//    print("==========================")
    result = min(result,tempResult)
}
print(result)
