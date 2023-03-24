n,m,t = map(int,input().split())
board = []
ad = [(0,1),(0,-1),(1,0),(-1,0)]
def rotate(i,d,k):
    global board
    if d == 0:
        for _ in range(k):
            board[i] = [board[i][-1]] + board[i][:m - 1]
    else:
        for _ in range(k):
            board[i] = board[i][1:] + [board[i][0]]
def check():
    global board
    temp = False
    for i in range(n):
        for j in range(m):
            if board[i][j] != 0:
                num = board[i][j]
                temp_check = False
                queue = [(i,j)]
                while queue:
                    cur = queue.pop()
                    for k in range(4):
                        nx = cur[0] + ad[k][0]
                        ny = cur[1] + ad[k][1]
                        if nx < 0 or nx >= n:
                            continue
                        if ny < 0:
                            ny += m
                        if ny >= m:
                            ny -= m
                        if board[nx][ny] == num:
                            queue.append((nx,ny))
                            temp = True
                            temp_check = True
                            board[nx][ny] = 0
                if temp_check:
                    board[i][j] = 0
    if temp:
        return
    avg = 0
    count = 0
    for i in range(n):
        for j in range(m):
            avg += board[i][j]
            if board[i][j] != 0:
                count += 1
    if count == 0:
        return
    avg /= count
    for i in range(n):
        for j in range(m):
            if board[i][j] != 0:
                if board[i][j] > avg:
                    board[i][j] -= 1
                elif board[i][j] < avg:
                    board[i][j] += 1
for _ in range(n):
    board.append(list(map(int,input().split())))
for _ in range(t):
    x,d,k = map(int,input().split())
    for i in range(n):
        if (i + 1) % x == 0:
            rotate(i,d,k)
    check()
result = 0
for i in range(n):
    for j in range(m):
        result += board[i][j]
print(result)