import Foundation

let n = Int(readLine()!)!
let price = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = 0
var info: [[[Int]]] = []
var discount: [Int] = []
var noDiscount: [Int] = []
var total: [[Int]] = []
var check = [Bool](repeating: false, count: n)
for i in 0..<n {
    let p = Int(readLine()!)!
    if p == 0 {
        info.append([])
        noDiscount.append(i)
        continue
    }
    discount.append(i)
    var temp: [[Int]] = []
    for _ in 0..<p {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        temp.append(input)
    }
    info.append(temp)
}
func dfs(_ arr: [Int]) {
    if arr.count == discount.count {
        total.append(arr)
    }
    for i in 0..<discount.count {
        if !check[i] {
            check[i] = true
            dfs(arr + [discount[i]])
            check[i] = false
        }
    }
}
if discount.isEmpty {
    print(price.reduce(0) { $0 + $1 })
    exit(0)
}
dfs([])
for arr in total {
    var temp = 0
    var tempPrice = price
    for i in 0..<arr.count {
        temp += tempPrice[arr[i]]
        for info in info[arr[i]] {
            let newPrice = tempPrice[info[0] - 1] - info[1]
            tempPrice[info[0] - 1] = newPrice <= 0 ? 1 : newPrice
        }
    }
    for item in noDiscount {
        temp += tempPrice[item]
    }
    result = result == 0 ? temp : min(temp,result)
}
print(result)
