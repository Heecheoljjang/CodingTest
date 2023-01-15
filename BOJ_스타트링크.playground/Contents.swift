import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
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
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
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
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let file = FileIO()

let f = file.readInt()
let s = file.readInt()
let g = file.readInt()
let u = file.readInt()
let d = file.readInt()

let dy = [u,-d]
var floor = Array(repeating: -1, count: f + 1)
var queue: [Int] = []

queue.append(s)
floor[s] = 0

while !queue.isEmpty {
    let current = queue.removeFirst()
    for i in 0..<dy.count {
        let newS = current + dy[i]
        if newS < 1 || newS > f {
            continue
        }
        if floor[newS] == -1 {
            queue.append(newS)
            floor[newS] = floor[current] + 1
        }
        if newS == g {
            break
        }
    }
}
if floor[g] == -1 {
    print("use the stairs")
} else {
    print(floor[g])
}
