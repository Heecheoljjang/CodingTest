from collections import deque
n,m = map(int,input().split())
board = []
d = [(1,0),(0,1),(-1,0),(0,-1)]
max_val = 0
for _ in range(n):
    board.append(list(input()))

for i in range(n):
    for j in range(m):
        if board[i][j] == "L":
            visited = [[-1 for _ in range(m)] for _ in range(n)]
            queue = deque()
            queue.append((i,j))
            visited[i][j] = 0
            while queue:
                cur = queue.popleft()
                for k in range(4):
                    new = (cur[0]+d[k][0],cur[1]+d[k][1])
                    if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= m:
                        continue
                    if visited[new[0]][new[1]] != -1:
                        continue
                    if board[new[0]][new[1]] == "W":
                        continue
                    queue.append(new)
                    visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + 1
                    max_val = max(max_val,visited[cur[0]][cur[1]] + 1)
print(max_val)