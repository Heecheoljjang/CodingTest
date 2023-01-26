import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    
    let n = game_board.count
    var boardVisited = Array(repeating: Array(repeating: false, count: n), count: n)
    var tableVisited = Array(repeating: Array(repeating: false, count: n), count: n)
    let dx = [1,0,-1,0]
    let dy = [0,1,0,-1]
    
    var spaces: [[[Int]]] = []
    var blocks: [[[Int]]] = []
    var result = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if !boardVisited[i][j] && game_board[i][j] == 0 {
                var queue = [[i,j]]
                boardVisited[i][j] = true
                var idx = 0
                while idx < queue.count {
                    let current = queue[idx]
                    idx += 1
                    for k in 0..<dx.count {
                        let newX = current[0] + dx[k]
                        let newY = current[1] + dy[k]
                        if newX < 0 || newY < 0 || newX >= n || newY >= n {
                            continue
                        }
                        if !boardVisited[newX][newY] && game_board[newX][newY] == 0 {
                            queue.append([newX,newY])
                            boardVisited[newX][newY] = true
                        }
                    }
                }
                spaces.append(queue)
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if !tableVisited[i][j] && table[i][j] == 1 {
                var queue = [[i,j]]
                tableVisited[i][j] = true
                var idx = 0
                while idx < queue.count {
                    let current = queue[idx]
                    idx += 1
                    for k in 0..<dx.count {
                        let newX = current[0] + dx[k]
                        let newY = current[1] + dy[k]
                        if newX < 0 || newY < 0 || newX >= n || newY >= n {
                            continue
                        }
                        if !tableVisited[newX][newY] && table[newX][newY] == 1 {
                            queue.append([newX,newY])
                            tableVisited[newX][newY] = true
                        }
                    }
                }
                queue = queue.sorted {
                    if $0[0] == $1[0] {
                        return $0[1] < $1[1]
                    }
                    return $0[0] < $1[0]
                }
                blocks.append(queue)
            }
        }
    }
    var check = Array(repeating: false, count: spaces.count) //사용했는지 확인하는 변수
outer: for block in blocks {
        //블럭의 맨 앞을 0,0으로 맞춤
        var current = block
        let x = current[0][0]
        let y = current[0][1]
        for i in 0..<current.count {
            current[i][0] -= x
            current[i][1] -= y
        }
        //space돌아가면서 맞는 공간 있는지 확인
        for i in 0..<spaces.count {
            if spaces[i].count != block.count {
                continue
            }
            //사용된 공간
            if check[i] {
                continue
            }
            //돌리고 정렬하고 0,0맞추고 비교
            var curSpace = spaces[i]
            for _ in 0...3 {
                //정렬하고
                curSpace = curSpace.sorted {
                    if $0[0] == $1[0] {
                        return $0[1] < $1[1]
                    }
                    return $0[0] < $1[0]
                }
                //00맞추고
                let spaceX = curSpace[0][0]
                let spaceY = curSpace[0][1]
                for j in 0..<curSpace.count {
                    curSpace[j][0] -= spaceX
                    curSpace[j][1] -= spaceY
                }
                if curSpace == current {
                    check[i] = true
                    result += curSpace.count
                    continue outer
                }
                //돌려야함
                //90도 회전 x,y => y,-x
                for k in 0..<curSpace.count {
                    let newX = curSpace[k][1]
                    let newY = -curSpace[k][0]
                    curSpace[k] = [newX,newY]
                }
            }
        }
    }
    return result
}
solution([[0,0,0],[1,1,0],[1,1,1]],[[1,1,1],[1,0,0],[0,0,0]])
