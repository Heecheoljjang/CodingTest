import sys
import math
from collections import deque
input = sys.stdin.readline

n, q = map(int,input().split())
boxSize = int(math.pow(2,n))
d = [(1,0),(0,1),(-1,0),(0,-1)]
board = []
temp_board = [[0 for _ in range(boxSize)] for _ in range(boxSize)]
totalIce = 0
bigIce = 0
def rotate(x,y,l):
    # x,y => y,-x
    global temp_board
    if l == 0:
        temp_board = board
        return
    size = int(math.pow(2,l))
    base = (x+int(math.pow(2,l - 1)), y + int(math.pow(2,l - 1)))
    print("x y",x,y)
    print(base)
    for i in range(x,x+size):
        for j in range(y,y+size):
            tx = i - base[0]
            ty = j - base[1]
            nx = ty + base[0]
            ny = base[1] - tx - 1
            temp_board[nx][ny] = board[i][j]

for _ in range(boxSize):
    board.append(list(map(int,input().split())))
l_list = list(map(int,input().split()))

for l in l_list:
    for i in range(0,boxSize,int(math.pow(2,l))):
        for j in range(0,boxSize,int(math.pow(2,l))):
            print("l이 뭐냐",l)
            rotate(i,j,l)
    print("@@@@@@@@")
    print("@@@@@@@@")
    print("@@@@@@@@")
    print("@@@@@@@@")
    print("@@@@@@@@")

    board = temp_board
    temp_board = [[0 for _ in range(boxSize)] for _ in range(boxSize)]
    for a in board:
        print(a)
    #얼음제거
    temp_del = []
    for i in range(boxSize):
        for j in range(boxSize):
            cur = (i,j)
            count = 0
            for k in range(4):
                nx = cur[0] + d[k][0]
                ny = cur[1] + d[k][1]
                if nx < 0 or ny < 0 or nx >= boxSize or ny >= boxSize:
                    continue
                if board[nx][ny] > 0:
                    count += 1
            if count < 3:
                temp_del.append((i,j))
    for point in temp_del:
        board[point[0]][point[1]] -= 1
    print("얼음제거 후")
    for a in board:
        print(a)
for i in range(boxSize):
    for j in range(boxSize):
        if board[i][j] > 0:
            totalIce += board[i][j]
visited = [[False for _ in range(boxSize)] for _ in range(boxSize)]
for i in range(boxSize):
    for j in range(boxSize):
        if board[i][j] > 0 and not visited[i][j]:
            visited[i][j] = True
            queue = deque()
            queue.append((i,j))
            tempCount = 1
            while queue:
                cur = queue.popleft()
                for k in range(4):
                    nx = cur[0] + d[k][0]
                    ny = cur[1] + d[k][1]
                    if nx < 0 or ny < 0 or nx >= boxSize or ny >= boxSize:
                        continue
                    if visited[nx][ny] or board[nx][ny] <= 0:
                        continue
                    visited[nx][ny] = True
                    queue.append((nx,ny))
                    tempCount += 1
            bigIce = max(bigIce,tempCount)
if totalIce == 0 and bigIce == 0:
    print(0)
    print(0)
else:
    print(totalIce)
    print(bigIce)
