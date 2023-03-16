import sys
input = sys.stdin.readline
n,m = map(int,input().split())
paper = []
for _ in range(n):
    paper.append(list(map(int,input().split())))
move = [(1,0),(-1,0),(0,1),(0,-1)]

visited = [[False for _ in range(m)] for _ in range(n)]
result = 0
def dfs(x,y,sum,count):
    global result

    if count == 4:
        result = max(result,sum)
        return
    for i in range(4):
        newX = x + move[i][0]; newY = y + move[i][1]
        if newX < 0 or newY < 0 or newX >= n or newY >= m:
            continue
        if not visited[newX][newY]:
            visited[newX][newY] = True
            dfs(newX,newY,sum + paper[newX][newY],count + 1)
            visited[newX][newY] = False
def elseBlock(x,y):
    # ㅜ ㅓ ㅗ ㅏ
    first = [(x,y),(x+1,y),(x,y - 1),(x,y + 1)]
    second = [(x,y),(x+1,y),(x - 1,y),(x,y - 1)]
    third = [(x,y),(x - 1,y),(x,y - 1),(x,y + 1)]
    fourth = [(x,y),(x+1,y),(x - 1,y),(x,y + 1)]
    for case in [first,second,third,fourth]:
        global result
        check = False
        sum = 0
        for i in range(len(case)):
            if check:
                break
            if case[i][0] < 0 or case[i][1] < 0 or case[i][0] >= n or case[i][1] >= m:
                check = True
                continue
            sum += paper[case[i][0]][case[i][1]]
        if check:
            continue
        result = max(result,sum)
for i in range(n):
    for j in range(m):
        visited[i][j] = True
        dfs(i,j,paper[i][j],1)
        visited[i][j] = False
        elseBlock(i,j)
print(result)