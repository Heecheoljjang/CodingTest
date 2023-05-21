from collections import deque
n, m = map(int,input().split())
lab = []
virus = []
total = []
result = 99999
d = [(1,0),(0,1),(-1,0),(0,-1)]
zeroCount = 0
for i in range(n):
    line = list(map(int,input().split()))
    for j in range(len(line)):
        if line[j] == 2:
            virus.append((i,j))
        elif line[j] == 0:
            zeroCount += 1
    lab.append(line)
def getTotal(arr,idx):
    if len(arr) == m:
        total.append(arr)
        return
    for i in range(idx,len(virus)):
        getTotal(arr+[virus[i]],i+1)
getTotal([],0)

def checkAll(b):
    for i in range(n):
        for j in range(n):
            if lab[i][j] == 0 and b[i][j] == -1:
                return False
    return True

print("==========LAB==========")
for a in lab:
    print(a)
for i in range(len(total)):
    queue = deque(total[i])
    visited = [[-1 for _ in range(n)] for _ in range(n)]
    maxValue = 0
    tempZero = zeroCount
    for v in queue:
        visited[v[0]][v[1]] = 0
    print("이번 바이러스 위치", total[i])
    print("지금 visited")
    for a in visited:
        print(a)
    while queue:
        cur = queue.popleft()
        print("cur   ", cur)
        for j in range(4):
            new = (cur[0]+d[j][0],cur[1]+d[j][1])
            print("new    ",new)
            if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= n:
                continue
            if lab[new[0]][new[1]] == 1:
                continue
            if visited[new[0]][new[1]] != -1:
                continue
            # if lab[new[0]][new[1]] == 2:
            #     print("들어와야지")
            #     visited[new[0]][new[1]] = 0
            # else:
            if lab[new[0]][new[1]] == 0:
                tempZero -= 1
                visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + 1
                queue.append(new)
                maxValue = max(maxValue, visited[cur[0]][cur[1]] + 1)
            else:
                if tempZero != 0:
                    visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + 1
                    queue.append(new)
                    maxValue = max(maxValue, visited[cur[0]][cur[1]] + 1)
    print("끝났어\n")
    for a in visited:
        print(a)
    if checkAll(visited):
        result = min(result,maxValue)
if result == 99999:
    print(-1)
else:
    print(result)