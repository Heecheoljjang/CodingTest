func d(_ n: Int) -> Int {
   
    var num: Int = n
    var temp: Int = n
    
    while temp != 0 {
        num += temp % 10
        temp /= 10
    }
    return num
}

var arr = [Int](repeating: 0, count: 10001)
for i in 1...10000 {
    var temp: Int
    temp = d(i)
    if temp <= 10000 && temp > 0 {
        arr[temp] = 1
    }
}
for i in 1...10000 {
    if arr[i] == 0 {
        print(i)
    }
}
