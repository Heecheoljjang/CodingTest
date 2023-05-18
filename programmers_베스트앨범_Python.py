def solution(genres, plays):
    answer = []
    dic = {}
    dicCount = {}
    for i in range(len(genres)):
        if genres[i] not in dic:
            dic[genres[i]] = [(i,plays[i])]
        else:
            dic[genres[i]].append((i,plays[i]))
        if genres[i] not in dicCount:
            dicCount[genres[i]] = plays[i]
        else:
            dicCount[genres[i]] += plays[i]
    dicKeys = list(dicCount.keys())
    dicKeys.sort(key=lambda x: dicCount[x],reverse = True)
    for key in dicKeys:
        temp = dic[key]
        temp.sort(key=lambda x: x[1],reverse = True)
        if len(temp) == 1:
            answer.append(temp[0][0])
        else:
            for i in range(2):
                answer.append(temp[i][0])
    return answer