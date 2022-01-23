func solution() -> Int {

    var N = Int(readLine()!)!
    var result: Int = 0
    
    if N % 5 == 0 {
        return N / 5
    }
    
    while N > 0 {
        N -= 3
        result += 1
        if N % 5 == 0{
            return result + N / 5
        }
    }
    return -1
}

print(solution())
