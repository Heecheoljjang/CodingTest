import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {

    var print: [Int] = priorities
    var myIndex: Int = location
    var result: Int = 1

    while true {
        if print[0] == print.max()! {
            if myIndex == 0 {
                break
            } else {
                print.removeFirst()
                result += 1
                myIndex -= 1
            }
        } else {
            if myIndex == 0 {
                let temp = print[0]
                print.removeFirst()
                print.append(temp)
                myIndex = print.count - 1
            } else {
                let temp = print[0]
                print.removeFirst()
                myIndex -= 1
                print.append(temp)
            }
        }
    }
    return result
}

solution([1,1,9,1,1,1], 0)
