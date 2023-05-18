def solution(clothes):
    dic = {}
    for cloth in clothes:
        if cloth[1] not in dic:
            dic[cloth[1]] = [cloth[0]]
        else:
            dic[cloth[1]].append(cloth[0])
    result = 1

    for i in dic.values():
        result *= len(i) + 1

    result -= 1
    return result