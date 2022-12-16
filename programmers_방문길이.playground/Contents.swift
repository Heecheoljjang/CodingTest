import Foundation

func solution(_ dirs:String) -> Int {
    
    var visited: [[[Int]]] = []
    var current = [0,0]
    for i in dirs {
        var temp = [current]
        switch i {
            case "U":
                current[1] += 1
                if current[1] > 5 {
                    current[1] -= 1
                    continue
                }
            case "D":
                current[1] -= 1
                if current[1] < -5 {
                    current[1] += 1
                    continue
                }
            case "R":
                current[0] += 1
                if current[0] > 5 {
                    current[0] -= 1
                    continue
                }
            case "L":
                current[0] -= 1
                if current[0] < -5 {
                    current[0] += 1
                    continue
                }
            default:
                break
        }
        temp.append(current)
        visited.append(temp.sorted {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        })
    }
    return Set(visited).count
}
