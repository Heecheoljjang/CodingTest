from collections import deque
def solution(maps):
    d = [(1,0),(0,1),(-1,0),(0,-1)]
    queue = deque()
    queue.append((0,0))
    n = len(maps)
    m = len(maps[0])
    visited = [[-1 for _ in range(m)] for _ in range(n)]
    visited[0][0] = 1
    while queue:
        cur = queue.popleft()
        if cur == (n - 1,m - 1):
            return visited[cur[0]][cur[1]]
        for i in range(4):
            new = (cur[0] + d[i][0], cur[1] + d[i][1])
            if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= m:
                continue
            if visited[new[0]][new[1]] != -1:
                continue
            if maps[new[0]][new[1]] == 0:
                continue
            queue.append(new)
            visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + 1
    return -1