import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {

    let start = [x - 1,y - 1]
    let end = [r - 1,c - 1]
    var stack: [([Int], [String])] = [(start, [])]
    let dx = [-1,0,0,1]
    let dy = [0,1,-1,0]
    let remain = (abs(end[0] - start[0]) + abs(end[1] - start[1])) % 2
    
    if k % 2 != remain {
        return "impossible"
    }
    while !stack.isEmpty {
        let current = stack.removeLast()
        if k - current.1.count < abs(end[0] - current.0[0]) + abs(end[1] - current.0[1]) {
            continue
        }
        if current.0 == end && current.1.count == k {
            return current.1.joined()
        }
        for i in 0..<dx.count {
            let newX = current.0[0] + dx[i]
            let newY = current.0[1] + dy[i]
            if newX < 0 || newY < 0 || newX >= n || newY >= m {
                continue
            }
            var word = ""
            switch i {
            case 0:
                word = "u"
            case 1:
                word = "r"
            case 2:
                word = "l"
            default:
                word = "d"
            }
            stack.append(([newX,newY],current.1 + [word]))
        }
    }
    return "impossible"
}
