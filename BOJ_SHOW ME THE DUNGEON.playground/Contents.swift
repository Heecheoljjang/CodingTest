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
let k = file.readInt()
var monster: [Int] = []
var people: [Int] = []
for _ in 0..<n {
    monster.append(file.readInt())
}
for _ in 0..<n {
    people.append(file.readInt())
}
var newMonster: [Int] = []
var newPeople: [Int] = []
var result = 0
var check = [Bool](repeating: false, count: n)

for i in 0..<monster.count {
    if monster[i] <= k {
        newMonster.append(monster[i])
        newPeople.append(people[i])
    }
}
if newMonster.isEmpty {
    print(0)
    exit(0)
}
func solution(_ arr: [Int], _ damage: Int, _ resque: Int) {
    if damage <= k {
        result = max(result,resque)
    }
    if damage >= k {
        return
    }
    for i in 0..<newMonster.count {
        if !check[i] {
            check[i] = true
            var tempDamage = 0
            let newArr = arr + [i]
            for j in newArr {
                tempDamage += newMonster[j]
            }
            solution(newArr, damage + tempDamage, resque + newPeople[i] )
            check[i] = false
        }
    }
}
solution([], 0, 0)
print(result)
