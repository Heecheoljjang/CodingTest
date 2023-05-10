import Foundation

//let n = Int(readLine()!)!
let n = 5
let aa = ["ZG508OK",
          "PU305A",
          "RI604B",
          "ZG206A",
          "ZG232ZF",
          "PU305A",
          "ZG232ZF",
          "ZG206A",
          "ZG508OK",
          "RI604B"]
var car: [String] = []
var dic: [String:Bool] = [:]
for i in 0..<n {
//    let s = readLine()!
    let s = aa[i]
    car.append(s)
    dic[s] = true
}
print(dic)
var result = 0
var cur = 0
//for _ in 0..<n {
for i in n..<n*2 {
//    let num = readLine()!
    let num = aa[i]
    print(num,cur,car[cur],result)
    if car[cur] != num {
        result += 1
        dic[num]! = false
    } else {
        while true {
            cur += 1
            if cur == n || dic[car[cur]]! {
                break
            }
        }
    }
}
print(result)
