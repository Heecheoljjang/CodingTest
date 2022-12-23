func solution(_ n:Int) -> Int {
    
    var fibonacciArr: [Int] = [0,1]
    for i in 2...n {
        fibonacciArr.append((fibonacciArr[i-1] + fibonacciArr[i-2])%1234567)
    }
    
    return fibonacciArr[n]
}

solution(10000)
