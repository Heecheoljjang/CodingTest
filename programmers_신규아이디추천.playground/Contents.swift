import Foundation

func solution(_ new_id: String) -> String {
    
    var myId: String = new_id
    myId = myId.lowercased() //굳
    
    var newId: String = ""
    
    for i in myId {
        if i.isLetter || i.isNumber || i == "-" || i == "_" || i == "." {
            newId.append(i)
        }
    }
    print(newId)
    
    while newId.contains(".."){
        newId = newId.replacingOccurrences(of: "..", with: ".")
    }
    print(newId)
    
    while newId.hasPrefix("."){
        newId.removeFirst()
    }
    print(newId)
    
    while newId.hasSuffix("."){
        newId.removeLast()
    }
    print(newId)
    if newId.isEmpty {
        newId.append("a")
    }
    
//    if newId.count >= 16 {
//        let newIndex: String.Index = newId.index(newId.startIndex, offsetBy: 15)
//        newId = String(newId[...newIndex])
//        if newId.hasSuffix("."){
//        newId.removeLast()
//    }
//    }
    
    while newId.count > 15 {
        newId.removeLast()
    }
    print(newId)
    print(newId.count)
    
    if newId.last == "." {
        newId.removeLast()
    }
    print(newId)
    if newId.count == 1 {
        let lastItem: String = String(newId.last!)
        newId.append(lastItem)
        newId.append(lastItem)
    } else if newId.count == 2 {
        let lastItem: String = String(newId.last!)
        newId.append(lastItem)
    }
    print(newId)
    return newId
}

solution("...!@BaT#*..y.abcdefghijklm")

