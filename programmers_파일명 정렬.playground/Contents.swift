import Foundation

func solution(_ files:[String]) -> [String] {

    var sepFile: [(head: String, number: Int, index: Int)] = []
    var result: [String] = []
    var count: Int = 0 //index 나타내기 위해
    
    for file in files {
        var head: String = ""
        var number: String = ""
        var index: Int = 0
        let fileArr = Array(file)
        //head
        while true {
            if !fileArr[index].isNumber {
                head.append(fileArr[index])
                index += 1
            } else {
                break
            }
        }
        //number
        while true {
            if fileArr[index].isNumber {
                number.append(fileArr[index])
                index += 1
                if index == fileArr.count {
                    break
                }
            } else {
                break
            }
        }
        sepFile.append((head.uppercased(), Int(number)!, count))
        count += 1
    }
    // 정렬
    sepFile.sort {
        if $0.head == $1.head {
            if $0.number == $1.number {
                return $0.index < $1.index
            }
            return $0.number < $1.number
        }
        return $0.head < $1.head
    }
    print(sepFile)
    for i in sepFile {
        result.append(files[i.index])
    }
    return result
}
solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"])


