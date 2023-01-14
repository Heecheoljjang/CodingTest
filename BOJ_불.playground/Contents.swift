import Foundation

let caseCount = Int(readLine()!)!
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
for _ in 0..<caseCount {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var building: [[String.Element]] = []
    var fire = Array(repeating: Array(repeating: -1, count: input[0]), count: input[1])
    var person = Array(repeating: Array(repeating: -1, count: input[0]), count: input[1])
    var fireQueue: [[Int]] = []
    var personQueue: [[Int]] = []
    var minTime = 0
    var check = false
    var idx = 0
    for _ in 0..<input[1] {
        building.append(readLine()!.map { $0 })
    }
    //시작점 넣기
    for i in 0..<input[1] {
        for j in 0..<input[0] {
            if building[i][j] == "*" {
                fireQueue.append([i,j])
                fire[i][j] = 0
            } else if building[i][j] == "@" {
                personQueue.append([i,j])
                person[i][j] = 0
            }
        }
    }
    //불
    while idx < fireQueue.count {
        let current = fireQueue[idx]
        idx += 1
        for k in 0..<dx.count {
            let newX = current[0] + dx[k]
            let newY = current[1] + dy[k]
            if newX < 0 || newY < 0 || newX >= input[1] || newY >= input[0] {
                continue
            }
            if fire[newX][newY] != -1 || building[newX][newY] == "#" {
                continue
            }
            fireQueue.append([newX,newY])
            fire[newX][newY] = fire[current[0]][current[1]] + 1
        }
    }
    idx = 0
    //사람
    outer: while idx < personQueue.count {
        let current = personQueue[idx]
        idx += 1
        for k in 0..<dx.count {
            let newX = current[0] + dx[k]
            let newY = current[1] + dy[k]
            if newX < 0 || newY < 0 || newX >= input[1] || newY >= input[0] {
                minTime = person[current[0]][current[1]] + 1
                check = true
                break outer
            }
            if person[newX][newY] >= 0 || building[newX][newY] == "#" {
                continue
            }
            if fire[newX][newY] != -1 && fire[newX][newY] <= person[current[0]][current[1]] + 1 {
                continue
            }
            personQueue.append([newX,newY])
            person[newX][newY] = person[current[0]][current[1]] + 1
        }
    }
    if check {
        print(minTime)
    } else {
        print("IMPOSSIBLE")
    }
}
