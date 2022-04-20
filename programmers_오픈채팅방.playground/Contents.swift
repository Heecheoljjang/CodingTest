import Foundation

func solution(_ record:[String]) -> [String] {
    
    //"id님이 들어왔습니다."하고 id를 change있으면 바꾸기. dictionary로 아이디랑 닉네임
    
    var result: [String] = []
    var idDic: [String: String] = [:]
    var idList: [String] = []
    
    for i in record {
        
        let status = i.components(separatedBy: " ")[0]
        
        if status == "Enter" {
            
            let id = i.components(separatedBy: " ")[1]
            let name = i.components(separatedBy: " ")[2]
            
            idList.append(id)
            idDic.updateValue(name, forKey: id)
            result.append("\(id)님이 들어왔습니다. \(id)")
        } else if status == "Leave" {
            let id = i.components(separatedBy: " ")[1]
            
            result.append("\(id)님이 나갔습니다. \(id)")
        } else {
            let id = i.components(separatedBy: " ")[1]
            let name = i.components(separatedBy: " ")[2]
            idDic.updateValue(name, forKey: id)
        }
    }
    
    for i in 0..<result.count {
        let id = result[i].components(separatedBy: " ")[2]
        result[i] = result[i].replacingOccurrences(of: id, with: idDic[id]!)
        result[i] = result[i].components(separatedBy: " ")[0] + " " + result[i].components(separatedBy: " ")[1]
    }
    return result
}
solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])

