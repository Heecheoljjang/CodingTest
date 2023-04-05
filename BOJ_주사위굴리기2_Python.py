from collections import deque
#오른쪽 동, 왼쪽 서, 아래 남, 위 북
n,m,k = map(int,input().split())
board = []
dice = [1,2,3,5,4,6] #위, 앞, 오, 뒤, 왼, 아
dir = 1 #동 1, 서 2, 남 3, 북 4
move = [(0,1),(0,-1),(1,0),(-1,0)]
score = 0
cur = (0,0) #주사위 좌표
for _ in range(n):
    board.append(list(map(int,input().split())))
def roll():
    global dice, dir, cur
    if dir == 1:
        new = [dice[4],dice[1],dice[0],dice[3],dice[5],dice[2]]
        cur = (cur[0],cur[1]+1)
    elif dir == 2:
        new = [dice[2],dice[1],dice[5],dice[3],dice[0],dice[4]]
        cur = (cur[0], cur[1]-1)
    elif dir == 3:
        new = [dice[1],dice[5],dice[2],dice[0],dice[4],dice[3]]
        cur = (cur[0]+1, cur[1])
    else:
        new = [dice[3],dice[0],dice[2],dice[5],dice[4],dice[1]]
        cur = (cur[0]-1, cur[1])
    dice = new
def getScore(x,y):
    global score
    b = board[x][y]
    visited = [[0 for _ in range(m)] for _ in range(n)]
    queue = deque()
    queue.append((x,y))
    count = 1
    visited[x][y] = 1
    while queue:
        cur = queue.popleft()
        for i in range(4):
            new = (cur[0]+move[i][0], cur[1]+move[i][1])
            if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= m:
                continue
            if board[new[0]][new[1]] == b and visited[new[0]][new[1]] == 0:
                queue.append(new)
                count += 1
                visited[new[0]][new[1]] = 1
    score += count * b
def changeDir(x,y):
    global dir
    a = dice[5]
    b = board[x][y]
    if a < b:
        #반시계
        if dir == 1:
            dir = 4
        elif dir == 2:
            dir = 3
        elif dir == 3:
            dir = 1
        else:
            dir = 2
    elif a > b:
        #시계
        if dir == 1:
            dir = 3
        elif dir == 2:
            dir = 4
        elif dir == 3:
            dir = 2
        else:
            dir = 1
def first(x,y):
    global dir
    if x+move[dir - 1][0] < n and y+move[dir - 1][1] < m and x+move[dir-1][0] >= 0 and y+move[dir - 1][1] >= 0:
        roll()
    else:
        if dir == 1:
            dir = 2
        elif dir == 2:
            dir = 1
        elif dir == 3:
            dir = 4
        else:
            dir = 3
        roll()
for _ in range(k):
    first(cur[0],cur[1])
    getScore(cur[0],cur[1])
    changeDir(cur[0],cur[1])
print(score)