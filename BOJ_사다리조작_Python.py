import sys
input = sys.stdin.readline

n, m ,h = map(int,input().split())

ladder = [[False for _ in range(n)] for _ in range(h)]
result = 4
for _ in range(m):
    a, b = map(int,input().split())
    ladder[a - 1][b - 1] = True
def check():
    for i in range(n):
        start = i
        for j in range(h):
            if ladder[j][start]:
                start += 1
            elif start > 0 and ladder[j][start - 1]:
                start -= 1
        if i != start:
            return False
    return True

def solution(count, nh, nn):
    global result
    if check():
        result = min(result,count)
        return
    if count == 3 or result <= count:
        return
    for i in range(nh,h):
        if i == nh:
            tempN = nn
        else:
            tempN = 0
        for j in range(tempN,n - 1):
            if ladder[i][j] or ladder[i][j + 1]:
                continue
            if j >= 1 and ladder[i][j - 1]:
                continue
            ladder[i][j] = True
            solution(count + 1, i, j + 2)
            ladder[i][j] = False
solution(0,0,0)
if result >= 4:
    print(-1)
else:
    print(result)