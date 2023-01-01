import Foundation

var count = 0
var result = -1
func mergeSort(_ arr: [Int], _ p: Int, _ r: Int) {
    if p < r {
        let q = (p + r) / 2
        mergeSort(arr, p, q)
        mergeSort(arr, q + 1, r)
        merge(arr, p, q, r)
    }
}
func merge(_ arr: [Int], _ p: Int, _ q: Int, _ r: Int) {
    var i = p
    var j = q + 1
    var t = 1
    var temp: [Int] = []
    var newArr = arr
    
    while(i <= q && j <= r) {
        if arr[i] <= arr[j] {
            temp.append(arr[i])
            i += 1
        } else {
            temp.append(arr[j])
            j += 1
        }
    }
    while i <= q {
        temp.append(arr[i])
        i += 1
    }
    while j <= r {
        temp.append(arr[j])
        j += 1
    }
    i = p
    t = 0
    while i <= r {
        newArr[i] = temp[t]
        count += 1
        if count == k {
            result = newArr[i]
            break
        }
        i += 1
        t += 1
    }
}

let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let arr = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]
mergeSort(arr, 0, n-1)
print(result)
