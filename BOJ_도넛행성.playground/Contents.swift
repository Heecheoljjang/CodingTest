import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()
let n = file.readInt()
let m = file.readInt()
var planet: [[Int]] = []

for _ in 0..<n {
    var temp: [Int] = []
    for _ in 0..<m {
        temp.append(file.readInt())
    }
    planet.append(temp)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var queue: [[Int]] = []
var count = 0
for i in 0..<n {
    for j in 0..<m {
        if visited[i][j] || planet[i][j] == 1 {
            continue
        }
        queue.append([i,j])
        count += 1
        //시간초과면 인덱스로해보기
        while !queue.isEmpty {
            let current = queue.removeFirst()
            for k in 0..<dx.count {
                var newX = current[0] + dx[k]
                var newY = current[1] + dy[k]
                if newX < 0 {
                    newX += n
                }
                if newX >= n {
                    newX -= n
                }
                if newY < 0 {
                    newY += m
                }
                if newY >= m {
                    newY -= m
                }
                if visited[newX][newY] || planet[newX][newY] == 1 {
                    continue
                }
                queue.append([newX,newY])
                visited[newX][newY] = true
            }
        }
    }
}
print(count)
