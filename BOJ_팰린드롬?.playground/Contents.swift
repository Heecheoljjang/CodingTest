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
let n = file.readInt()
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(file.readInt())
}
let m = file.readInt()
var result = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n {
    result[i][i] = true
}
for i in 0..<n-1 {
    if numbers[i] == numbers[i+1] {
        result[i][i+1] = true
    }
}
for s in stride(from: n - 3, through: 0, by: -1) {
    for e in s+2..<n {
        if result[s+1][e-1] && numbers[s] == numbers[e] {
            result[s][e] = true
        }
    }
}
for _ in 0..<m {
    let s = file.readInt() - 1
    let e = file.readInt() - 1
    if result[s][e] {
        print("1")
    } else {
        print("0")
    }
}

