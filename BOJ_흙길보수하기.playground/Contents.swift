import Foundation

//let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let n = input[0]; let l = input[1]
//var pools:[(Int,Int)] = []
//for _ in 0..<n {
//    let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
//    pools.append((temp[0],temp[1]))
//}
let n = 3
let l = 3
var pools = [(1,6),(13,17),(8,12)]
pools.sort{ $0.1 > $1.1 }
print(pools)
var point = pools[0].1
var count = 0
for pool in pools {
    print("pool", pool)
    if pool.1 < point {
        point = pool.1
    }
    if point >= pool.0 {
        var temp = (point - pool.0) / l
        print("temp",temp)
        if (point - pool.0) % l != 0 {
            temp += 1
        }
        count += temp
        point -= temp * l
        print("최종temp", temp)
        print(point)
    }
}
print(count)
