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

let n = file.readInt(); let c = file.readInt()
var dic: [Int:(Int,Int)] = [:] //숫자:(개수:순서)
var numbers: [(Int,(Int,Int))] = []
for i in 0..<n {
    let num = file.readInt()
    if dic[num] == nil {
        dic[num] = (1,i)
    } else {
        dic[num]!.0 += 1
    }
}
for key in dic.keys {
    numbers.append((key,(dic[key]!.0,dic[key]!.1)))
}
numbers.sort {
    if $0.1.0 == $1.1.0 {
        return $0.1.1 < $1.1.1
    }
    return $0.1.0 > $1.1.0
}
var answer = ""
for number in numbers {
    answer += String(repeating: "\(number.0) ", count: number.1.0)
}
print(answer)
