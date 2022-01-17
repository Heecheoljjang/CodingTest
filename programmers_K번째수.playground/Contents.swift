import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {

    var numArray = [Int](repeating: 0, count: commands.count)
    var newArray: [Int] = []

    for i in 0..<commands.count {
        var a = commands[i][0] - 1
        newArray = []
        while a <= commands[i][1] - 1 {
            newArray.append(array[a])
            a += 1
            print(newArray)
        }
        newArray = newArray.sorted{$0 < $1}
        print(newArray)
        numArray[i] = newArray[commands[i][2] - 1]
    }

    return numArray
}
solution([1,5,2,6,3,7,4], [[2,5,3],[4,4,1],[1,7,3]])


