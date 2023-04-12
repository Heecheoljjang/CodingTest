import sys
from collections import deque
input = sys.stdin.readline

r,c = map(int,input().split())
board = []
for _ in range(r):
    board.append(list(input()))
d = [(1,0),(0,1),(-1,0),(0,-1)]
# history = set()
visited = [[0 for _ in range(c)] for _ in range(r)]
check = [0 for _ in range(26)]
# queue = deque()
# queue.append((0,0,1)) #x,y,값
visited[0][0] = 1
val = 1
check[ord(board[0][0]) - 65] = 1
# history.add(board[0][0])
def dfs(x,y,count):
    print("a")
    global val
    for i in range(4):
        new = (x + d[i][0],y+d[i][1])
        if new[0] < 0 or new[1] < 0 or new[0] >= r or new[1] >= c:
            continue
        # if board[new[0]][new[1]] in history:
        #     continue
        if check[ord(board[new[0]][new[1]]) - 65] == 1:
            continue
        if visited[new[0]][new[1]] != 0:
            continue
        visited[new[0]][new[1]] = 1
        check[ord(board[new[0]][new[1]]) - 65] = 1
        # his tory.add(board[new[0]][new[1]])
        dfs(new[0],new[1],count + 1)
        visited[new[0]][new[1]] = 0
        check[ord(board[new[0]][new[1]]) - 65] = 0

        # history.remove(board[new[0]][new[1]])
    val = max(count,val)
    return
dfs(0,0,1)
print(val)
# while queue:
#     cur = queue.popleft()
#     for i in range(4):
#         new = (cur[0]+d[i][0],cur[1]+d[i][1],cur[2] + 1)
#         if new[0] < 0 or new[1] < 0 or new[0] >= r or new[1] >= c:
#             continue
#         if board[new[0]][new[1]] in history:
#             continue
#         if visited[new[0]][new[1]] != 0:
#             continue
#         queue.append(new)
#         val = max(val,new[2])
#         visited[new[0]][new[1]] = 1
# print(val)









