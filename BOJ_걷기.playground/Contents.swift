import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
if input[2] * 2 <= input[3] {
    print((input[0]+input[1])*input[2])
} else {
    var result = 0
    let minValue = min(input[0],input[1])
    result += minValue * input[3]
    let remain = abs(input[0] - input[1])
    if input[2] <= input[3] {
        result += remain * input[2]
    } else {
        if remain % 2 == 0 {
            result += remain * input[3]
        } else {
            result += (remain - 1) * input[3] + input[2]
        }
    }
    print(result)
}
