import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [3,7,7]
let n = input[0]; let r = input[1]; let c = input[2]

func solution(_ n: Int, _ row: Int, _ col: Int) -> Int {
    if n == 0 {
        return 0
    }
    let half = Int(pow(Double(2),Double(n - 1)))
    if row < half && col < half {
        return solution(n - 1,row,col)
    } else if row < half && col >= half {
        return half * half + solution(n - 1,row,col - half)
    } else if row >= half && col < half {
        return 2 * half * half + solution(n - 1,row - half,col)
    } else {
        return 3 * half * half + solution(n - 1, row - half, col - half)
    }
}
solution(n,r,c)
