from collections import deque
n = int(input())
board = []
result = 0
height = set()
for _ in range(n):
    line = list(map(int,input().split()))
    board.append(line)
    height.update(line)
height.add(min(height)-1)
print(height)

d = [(1,0),(0,1),(-1,0),(0,-1)]
for h in height:
    visited = [[False for _ in range(n)] for _ in range(n)]
    count = 0
    for i in range(n):
        for j in range(n):
            if board[i][j] > h and not visited[i][j]:
                queue = deque()
                queue.append((i,j))
                count += 1
                while queue:
                    cur = queue.popleft()
                    for k in range(4):
                        new = (cur[0]+d[k][0],cur[1]+d[k][1])
                        if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= n:
                            continue
                        if visited[new[0]][new[1]] or board[new[0]][new[1]] <= h :
                            continue
                        queue.append(new)
                        visited[new[0]][new[1]] = True
    result = max(result,count)
print(result)