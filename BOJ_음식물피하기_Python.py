import sys
input = sys.stdin.readline
n, m, k = map(int, input().split())
board = [[0 for _ in range(m)] for _ in range(n)]
dx = [1,0,-1,0]; dy = [0,1,0,-1]
result = 0
for _ in range(k):
    temp = list(map(int,input().split()))
    board[temp[0] - 1][temp[1] - 1] = 1
for i in range(n):
    for j in range(m):
        if board[i][j] == 1:
            count = 1
            board[i][j] = 0
            queue = [(i,j)]
            while queue:
                cur = queue.pop(0)
                for k in range(len(dx)):
                    newX = cur[0] + dx[k]
                    newY = cur[1] + dy[k]
                    if newX < 0 or newY < 0 or newX >= n or newY >= m:
                        continue
                    if board[newX][newY] == 1:
                        count += 1
                        board[newX][newY] = 0
                        queue.append((newX,newY))
            result = max(result,count)
print(result)