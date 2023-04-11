def solution(n):
    target = n*(n+1)//2
    answer = [0 for _ in range(target)]
    count = 2 #숫자
    dir = 0 # 0:아, 1: 오, 2: 왼쪽위
    next = 0
    cur = 0 #현재인덱스
    level = 1
    answer[cur] = 1
    while count <= target:
        if dir == 0:
            if cur + level > target - 1 or answer[cur+level] != 0:
                dir = 1
                next = cur + 1
            else:
                next = cur + level
                level += 1
        elif dir == 1:
            if cur + 1 > target - 1 or answer[cur+1] != 0:
                dir = 2
                next = cur - level
                level -= 1
            else:
                next = cur + 1
        else:
            if cur - level < 0 or answer[cur-level]:
                dir = 0
                next = cur + level
                level += 1
            else:
                next = cur - level
                level -= 1
        cur = next
        answer[cur] = count
        count += 1
    return 1
solution(6)