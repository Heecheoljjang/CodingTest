import Foundation

let dx = [1,0,-1,0]; let dy = [0,1,0,-1]
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [3,3]
let n = input[0]; let m = input[1];
//let people = readLine()!.split(separator: " ").map { Int(String($0))! }
let people = [2,2,1,1]
let ju = (people[0] - 1,people[1] - 1); let cr = (people[2] - 1,people[3] - 1)
//var room: [[String]] = []
var room = [["#","0","0"],
            ["0","*","0"],
            ["0","0","0"]]
var count = 0
var visited = Array(repeating: Array(repeating: -1, count: m), count: n)
visited[ju.0][ju.1] = 0
//for _ in 0..<n {
//    room.append(readLine()!.map { String($0) })
//}
while true {
    var queue = [ju]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        if cur == cr {
            print(visited[cur.0][cur.1])
            exit(0)
        }
        for i in 0..<dx.count {
            let newX = cur.0 + dx[i]
            let newY = cur.1 + dy[i]
            if newX < 0 || newY < 0 || newX >= n || newY >= m {
                continue
            }
            if visited[newX][newY] != -1 {
                continue
            }
            if visited[newX][newY] == -1 {
                if room[newX][newY] == "0" {
                    queue.append((newX,newY))
                    visited[newX][newY] = visited[cur.0][cur.1]
                } else {
                    visited[newX][newY] = visited[cur.0][cur.1] + 1
                    room[newX][newY] = "0"
                    queue.append((newX,newY))
                }
            }
        }
    }
}
