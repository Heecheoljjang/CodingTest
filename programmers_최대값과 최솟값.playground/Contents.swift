func solution(_ s:String) -> String {
    
    return "\(s.split(separator: " ").map { Int(String($0))! }.min()!) \(s.split(separator: " ").map { Int(String($0))! }.max()!)"
}

solution("1 -2 3 -4 5 6 7")
