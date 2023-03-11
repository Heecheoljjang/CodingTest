n = int(input())
board = []
count = 0
result = []
dx = [1,0,-1,0]; dy = [0,1,0,-1]
visited = [[False for _ in range(n)] for _ in range(n)]
for _ in range(n):
    board.append(list(input()))
for i in range(n):
    for j in range(n):
        if board[i][j] == "1" and visited[i][j] == False :
            queue = [(i,j)]
            visited[i][j] = True
            count += 1
            temp = 1
            while queue:
                cur = queue.pop(0)
                for k in range(0,4):
                    newX = cur[0] + dx[k]; newY = cur[1] + dy[k]
                    if newX < 0 or newY < 0 or newX >= n or newY >= n:
                        continue
                    if board[newX][newY] == "0" or visited[newX][newY] == True:
                        continue
                    temp += 1
                    queue.append((newX,newY))
                    visited[newX][newY] = True
            result.append(temp)
print(count)
result.sort()
for i in range(len(result)):
    print(result[i])
