from collections import deque


def solution(rectangle, characterX, characterY, itemX, itemY):
    d = [(1, 0), (0, 1), (-1, 0), (0, -1)]
    box = [[0 for _ in range(102)] for _ in range(102)]
    visited = [[-1 for _ in range(102)] for _ in range(102)]
    start = (characterX * 2, characterY * 2)
    target = (itemX * 2, itemY * 2)
    for i in range(len(rectangle)):
        for j in range(rectangle[i][0] * 2, rectangle[i][2] * 2 + 1):
            for k in range(rectangle[i][1] * 2, rectangle[i][3] * 2 + 1):
                box[j][k] = 1
    for i in range(len(rectangle)):
        for j in range(rectangle[i][0] * 2, rectangle[i][2] * 2 + 1):
            for k in range(rectangle[i][1] * 2, rectangle[i][3] * 2 + 1):
                if j != rectangle[i][0] * 2 and j != rectangle[i][2] * 2 and k != rectangle[i][1] * 2 and k != \
                        rectangle[i][3] * 2:
                    box[j][k] = 0

    queue = deque()
    queue.append(start)
    visited[start[0]][start[1]] = 0
    while queue:
        cur = queue.popleft()
        if cur == target:
            return visited[cur[0]][cur[1]] // 2
        for i in range(4):
            new = (cur[0] + d[i][0], cur[1] + d[i][1])
            if box[new[0]][new[1]] == 1 and visited[new[0]][new[1]] == -1:
                queue.append(new)
                visited[new[0]][new[1]] = visited[cur[0]][cur[1]] + 1
