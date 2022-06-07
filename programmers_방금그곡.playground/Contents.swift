//import Foundation
//
//func solution(_ m:String, _ musicinfos:[String]) -> String {
//
//    var songStr: [String: [Int]] = [:] // [노래제목: [시간, 순서]]
//    var tempStr: String = ""
//    var result: String = ""
//    var tempCount: Int = 0
//
//    var tempArr: [String] = []
//    var temp: String = ""
//
//    for music in musicinfos {
//        let startTime = Int(music.split(separator: ",")[0].split(separator: ":")[0])! * 60 + Int(music.split(separator: ",")[0].split(separator: ":")[1])!
//        let endTime = Int(music.split(separator: ",")[1].split(separator: ":")[0])! * 60 + Int(music.split(separator: ",")[1].split(separator: ":")[1])!
//        let playTime = endTime - startTime
//        let title = music.split(separator: ",")[2]
//        let infoArr = Array(music.split(separator: ",")[3]) // #이 따로 있는 상태임
//        var index = 0
//
//        // infoArr # 처리해주기
//        for i in infoArr {
//            if i == "#" {
//                temp.append(i)
//                tempArr.append(temp)
//                temp = ""
//            } else {
//                if temp != "" {
//                    tempArr.append(temp)
//                    temp = ""
//                    temp.append(i)
//                } else {
//                    temp.append(i)
//                }
//            }
//        }
//        if temp != "" {
//            tempArr.append(temp)
//        }
//        while tempCount != playTime {
//            tempStr.append(tempArr[index])
//            tempCount += 1
//            index += 1
//            if index == tempArr.count {
//                index = 0
//            }
//        }
//        //m이 포함되는지 확인
//        //마지막에 #붙은거 빼도 포함되는게 있는지확인 -> 중간에 #있는것은 contain으로 나오지않으므로 신경안써도됨
////        if tempStr.contains(m) {
////            // m의 마지막이 #이라면 뒤에 #이 붙을리없기때문에 tempStr이 m을 포함한다면 확실하게 포함하는 것임.
////            if m.last == "#" {
////                songStr[String(title)] = [playTime, checkCount]
////                checkCount += 1
////            } else {
////                // m의 마지막이 알파벳이라면 #이 붙은 m을 포함하는지, 진짜 m만 포함하는지 확인해야함.
////                // 먼저, m에 #을 붙인 문자열을 포함하지 않는다면 m을 포함하고 있는 것임
////                if !tempStr.contains(m + "#") {
////                    songStr[String(title)] = [playTime, checkCount]
////                    checkCount += 1
////                } else {
////                    // m에 #을 붙인 문자열을 포함할때 그 문자열만 포함하는지 m도 포함하는지 확인해야함.
////                    tempStr = tempStr.replacingOccurrences(of: m + "#", with: "")
////                    if tempStr.contains(m) {
////                        songStr[String(title)] = [playTime, checkCount]
////                        checkCount += 1
////                    }
////                }
////            }
////        }
//        if m.last == "#" {
//            if tempStr.contains(m) {
//                songStr[String(title)] = [playTime, Int(music.split(separator: ",")[0].split(separator: ":")[0])!]
////                checkCount += 1
//            }
//        } else {
//            if tempStr.contains(m) {
//                if tempStr.contains(m + "#") {
//                    tempStr = tempStr.replacingOccurrences(of: m + "#", with: "")
//                    if tempStr.contains(m) {
//                        songStr[String(title)] = [playTime, Int(music.split(separator: ",")[0].split(separator: ":")[0])!]
////                        checkCount += 1
//                    }
//                } else {
//                    songStr[String(title)] = [playTime, Int(music.split(separator: ",")[0].split(separator: ":")[0])!]
////                    checkCount += 1
//                }
//
//            }
//        }
//        tempStr = ""
//        tempCount = 0
//        tempArr = []
//    }
//    // 중복되는 것이 있으면 시간이 가장 긴 것을 리턴
//    if songStr.count == 0 {
//        return "(None)"
//    } else {
//        let high = songStr.sorted {$0.value[0] > $1.value[0]}[0].value[0]
//        result = songStr.filter {$0.value[0] == high}.sorted {$0.value[1] < $1.value[1]}[0].key
//    }
//    return result
//}
//solution("A#", ["12:00,12:02,HELLO,B#A#"])


//치환해서 풀기
import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var songs: [String: [Int]] = [:] // [노래제목: [checkCount, playtime]] -> playTime은 뭐가 더 길게 재생됐는지 확인하기 위해, checkCount은 재생시간이 같을때 뭐가 더 먼저 입력됐는지 확인
    var checkCount: Int = 0
    var tempStr: String = ""
    var result: String = ""
    
    //# 들어간 음을 치환해줌
    let m = m.replacingOccurrences(of: "C#", with: "c").replacingOccurrences(of: "D#", with: "d").replacingOccurrences(of: "F#", with: "f").replacingOccurrences(of: "G#", with: "g").replacingOccurrences(of: "A#", with: "a")
    for music in musicinfos {
        let startTime = Int(music.split(separator: ",")[0].split(separator: ":")[0])! * 60 + Int(music.split(separator: ",")[0].split(separator: ":")[1])!
        let endTime = Int(music.split(separator: ",")[1].split(separator: ":")[0])! * 60 + Int(music.split(separator: ",")[1].split(separator: ":")[1])!
        let playTime = endTime - startTime
        let title = music.split(separator: ",")[2]
        let infoArr = Array(music.split(separator: ",")[3].replacingOccurrences(of: "C#", with: "c").replacingOccurrences(of: "D#", with: "d").replacingOccurrences(of: "F#", with: "f").replacingOccurrences(of: "G#", with: "g").replacingOccurrences(of: "A#", with: "a"))
        var index = 0
    
        //재생된 음들의 문자열
        while tempStr.count != playTime {
            tempStr.append(infoArr[index])
            index += 1
            if index == infoArr.count {
                index = 0
            }
        }
        if tempStr.contains(m) {
            songs[String(title)] = [checkCount, playTime]
            checkCount += 1
        }
        tempStr = ""
    }
    if songs.count == 0 {
        return "(None)"
    } else {
        let high = songs.sorted {$0.value[1] > $1.value[1]}[0].value[1]
        result = songs.filter {$0.value[1] == high}.sorted {$0.value[0] < $1.value[0]}[0].key
    }
    return result
}
solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"])
