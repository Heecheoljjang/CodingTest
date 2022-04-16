import Foundation

func solution(_ numbers:[Int]) -> String {

    let number: [Int] = numbers.sorted{Int("\($0)\($1)")! > Int("\($1)\($0)")!}
    
    if number[0] == 0 {
        return "0"
    }
    
    return number.reduce(""){$0 + String($1)}
}

