func solution(_ cacheSize:Int, _ cities:[String]) -> Int {

    var cacheArr: [String] = []
    var city: [String] = []
    var count: Int = 0

    // 0인 경우에 바로 리턴
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    // 대소문자 구분 안하므로 전부 소문자로
    for i in 0..<cities.count {
        city.append(cities[i].lowercased())
    }
    
    for i in city {
        //캐시가 비어있다면 추가
        if cacheArr.count < cacheSize {
            //맨 앞에 넣음 -> removelast가 시간복잡도가 더 작을거라고 생각했음.
            if cacheArr.contains(i) {
                cacheArr.remove(at: cacheArr.firstIndex(of: i)!)
                cacheArr.insert(i, at: 0)
                count += 1
            } else {
                cacheArr.insert(i, at: 0)
                count += 5
            }
        } else {
            //캐시가 가득차있을때
            //캐시에 이미 있을때, count에 1 더해주고 가장 앞쪽으로 옮김
            if cacheArr.contains(i) {
                cacheArr.remove(at: cacheArr.firstIndex(of: i)!)
                cacheArr.insert(i, at: 0)
                count += 1
            } else {
                cacheArr.removeLast()
                cacheArr.insert(i, at: 0)
                count += 5
            }
        }
    }
    return count
}
solution(0, ["aa","aa"])
