import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var player = 2
    var turn = 1
    var used = [words[0]]
    
    for i in 1..<words.count {
        used.append(words[i])
        //반복된 단어가 들어가면 count가 다를것임
        if used.count != Set(used).count {
            return [player, turn]
        }
        
        //잘못된 단어 말한경우
        if words[i-1].last! != words[i].first! {
            return [player, turn]
        }
        
        player += 1
        if player == n + 1 {
            player = 1
            turn += 1
        }
    }
    return [0,0]
}

solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"])
