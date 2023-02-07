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

let k = file.readInt()
outer: for _ in 0..<k {
    var input: [Int] = []
    for _ in 0...1 {
        input.append(file.readInt())
    }
    let v = input[0]; let e = input[1]
    var lines: [Int: [Int]] = [:]
    var visited = Array(repeating: 0, count: v + 1)
    var queue: [Int] = []
    for _ in 0..<e {
        var line: [Int] = []
        for _ in 0...1 {
            line.append(file.readInt())
        }
        if lines[line[0]] == nil {
            lines[line[0]] = [line[1]]
        } else {
            lines[line[0]]!.append(line[1])
        }
        if lines[line[1]] == nil {
            lines[line[1]] = [line[0]]
        } else {
            lines[line[1]]!.append(line[0])
        }
    }
    for i in 1...v {
        if visited[i] == 0 {
            visited[i] = 1
        }
        queue = [i]
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if lines[cur] == nil {
                continue
            }
            for j in 0..<lines[cur]!.count {
                if visited[lines[cur]![j]] == 0 {
                    queue.append(lines[cur]![j])
                    visited[lines[cur]![j]] = -visited[cur]
                } else {
                    if visited[lines[cur]![j]] == visited[cur] {
                        print("NO")
                        continue outer
                    }
                }
            }
        }
    }
    print("YES")
}
