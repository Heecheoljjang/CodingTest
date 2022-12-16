import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var result = 0
    let skillArr = skill.map { "\($0)" }
    
    for tree in skill_trees {
        let arr = tree.map { "\($0)" }.filter { skillArr.contains($0) }
        var temp: [Int] = []
        var check = false
        
        if arr.count == 0 {
            result += 1
            continue
        }
        
        for i in arr {
            let index = skillArr.firstIndex(of: i)!
            if temp.count == 0 {
                if index == 0 {
                    temp.append(index)
                } else {
                    check = true
                    break
                }
            } else {
                if temp.contains(index - 1) {
                    temp.append(index)
                } else {
                    check = true
                    break
                }
            }
        }
        if !check && temp.count != 0 {
            result += 1
        }
    }
    return result
}
