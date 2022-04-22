import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{

    var answer: Int64 = 0
    var gcdValue: Int = 0
    
    func gcd(_ a: Int, _ b: Int) {
        if b == 0 {
            gcdValue = a
        } else {
            gcd(b,a%b)
        }
    }
    gcd(h, w)
    answer = Int64(h * w) - Int64(w + h) + Int64(gcdValue)
    return answer
}
solution(12, 8)
