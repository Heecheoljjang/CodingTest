from collections import deque
d = [(1, 0), (0, 1), (-1, 0), (0, -1)]
T = int(input())
for test_case in range(1, T + 1):
    n = int(input())
    board = []
    visited = [[-1 for _ in range(n)] for _ in range(n)]
    for _ in range(n):
        board.append(input())
    visited[0][0] = 0
    queue = deque()
    queue.append((0, 0))
    while queue:
        cur = queue.popleft()
        for i in range(4):
            new = (cur[0] + d[i][0], cur[1] + d[i][1])
            if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= n:
                continue
            if visited[new[0]][new[1]] == -1:
                visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + int(board[new[0]][new[1]])
                queue.append(new)
            else:
                if visited[cur[0]][cur[1]] + int(board[new[0]][new[1]]) < visited[new[0]][new[1]]:
                    visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + int(board[new[0]][new[1]])
                    queue.append(new)

    print(f"#{test_case}",visited[n-1][n-1])
