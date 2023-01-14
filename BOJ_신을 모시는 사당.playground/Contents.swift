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
var stone: [Int] = []
for _ in 0..<n {
    stone.append(file.readInt())
}
var newStone: [Int] = []
var temp = 0
var current = stone[0]
for i in 0..<n {
    if stone[i] == current {
        temp += 1
    } else {
        if current == 1 {
            newStone.append(temp)
        } else {
            newStone.append(-temp)
        }
        temp = 1
        current = stone[i]
    }
}
if current == 1 {
    newStone.append(temp)
} else {
    newStone.append(-temp)
}

//함수를 나눈다면 메모리 차이가남
func dp(_ arr: [Int]) -> Int {
    var cacheMax = Array(repeating: 0, count: arr.count)
    var cacheMin = Array(repeating: 0, count: arr.count)
    cacheMax[0] = arr[0]
    cacheMin[0] = arr[0]
    for i in 1..<arr.count {
        cacheMax[i] = max(0,cacheMax[i-1]) + arr[i]
        cacheMin[i] = min(0,cacheMin[i-1]) + arr[i]
    }
    return max(cacheMax.max()!, abs(cacheMin.min()!))
}
print(dp(newStone))
