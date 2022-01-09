import UIKit
import Foundation

func solution(_ board:[[Int]], _ moves: [Int]) -> Int {

    var board: [[Int]] = board
    var basket: [Int] = []
    var basketLast: Int?
    var count: Int = 0
    
    for i in moves {
        basketLast = basket.last
        for j in 0...(board.count - 1) {
            if board[j][i-1] != 0 {
                basket.append(board[j][i-1])
                board[j][i-1] = 0
                if basket.last == basketLast {
                    basket.removeLast()
                    basket.removeLast()
                    count += 2
                }
                break
            } else {
                continue
            }
        }
    }
    print(basket)
    print(count)
    return basket.count
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])
