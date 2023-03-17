import sys
from collections import deque
input = sys.stdin.readline

n,m,k = map(int,input().split())
board = [[deque() for _ in range(n)] for _ in range(n)]
moveDir = [(-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1),(0,-1),(-1,-1)]
fireballs = deque()
#x,y,질량,방향,속력
for _ in range(m):
    x,y,m,s,d = map(int,input().split())
    fireballs.append((x - 1,y - 1,m,s,d))
for _ in range(k):
    while fireballs:
        ball = fireballs.popleft()
        print(ball,"@")
        newX = ball[0] + moveDir[ball[4]][0] * ball[3]
        newY = ball[1] + moveDir[ball[4]][1] * ball[3]
        newX %= n
        newY %= n
        print(newX,newY)
        board[newX][newY].append((newX,newY,ball[2],ball[3],ball[4]))
    print("============================")
    print(board)
    print("============================")
    for i in range(n):
        for j in range(n):
            if len(board[i][j]) == 1:
                print("바보")
                fireballs.append(board[i][j].popleft())
            elif len(board[i][j]) > 1:
                print("cjswo")
                #나눠야됨
                count = len(board[i][j])
                sumM, sumS, odd, even = 0,0,0,0
                while board[i][j]:
                    temp = board[i][j].popleft()
                    sumM += temp[2]
                    sumS += temp[3]
                    if temp[4] % 2 == 0:
                        even += 1
                    else:
                        odd += 1
                newM = sumM // 5
                if newM == 0:
                    continue
                newS = sumS // count
                if odd == 0 or even == 0:
                    newDir = [0,2,4,6]
                else:
                    newDir = [1,3,5,7]
                for dir in newDir:
                    fireballs.append((i,j,newM,newS,dir))
result = 0
print(fireballs,"@@@@@@@")
for i in range(len(fireballs)):
    result += fireballs[i][2]
print(result)