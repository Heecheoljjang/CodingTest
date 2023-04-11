n = int(input())
board = []
d = [1, 2, 3, 4]  # 오,아,왼,위
for _ in range(n):
    board.append(list(map(int, input().split())))
count = 0
max_val = 0
for i in range(n):
    for j in range(n):
        max_val = max(max_val,board[i][j])
total = []
visited = [False for _ in range(4)]

test_board = []
for i in range(len(board)):
    test_board.append(board[i])
def allCase(arr, target):
    if target == 5:
        total.append(arr)
        return
    for i in range(4):
        visited[i] = True
        allCase(arr + [d[i]], target + 1)
        visited[i] = False

def checkBiggest():
    val = 0
    for i in range(n):
        for j in range(n):
            val = max(max_val, board[i][j])
    return val


def moveBlock(block, dir):
    global max_val
    temp = []
    for i in range(len(block)):
        temp.append(block[i])
    after = []
    check_board = [[0 for _ in range(n)] for _ in range(n)]
    if dir == 1:
        for j in range(n):
            # j번째 줄 의미
            rev = temp[j][::-1]
            t = -1
            real = []
            for k in range(n):
                if rev[k] == 0:
                    continue
                if t == -1:
                    t = rev[k]
                else:
                    if t == rev[k]:
                        real.append(rev[k]*2)
                        max_val = max(rev[k]*2,max_val)
                        t = -1
                    else:
                        real.append(t)
                        t = rev[k]
            if t != -1:
                real.append(t)
            for k in range(len(temp) - len(real)):
                real.append(0)
            after.append(real[::-1])
    elif dir == 2:
        t_t = [[0 for _ in range(n)] for _ in range(n)]
        for j in range(n): #열
            t = -1
            real = []
            for i in range(n-1,-1,-1):
                if temp[i][j] == 0:
                    continue
                if t == -1:
                    t = temp[i][j]
                else:
                    if t == temp[i][j]:
                        real.append(temp[i][j] * 2)
                        max_val = max(temp[i][j] * 2, max_val)
                        t = -1
                    else:
                        real.append(t)
                        t = temp[i][j]
            if t != -1:
                real.append(t)
            for i in range(len(real)):
                 t_t[n-1-i][j] = real[i]
        after = t_t
        if after == check_board:
            after == board
    elif dir == 3:
        for j in range(n):
            t = -1
            real = []
            for k in range(n):
                if temp[j][k] == 0:
                    continue
                if t == -1:
                    t = temp[j][k]
                else:
                    if t == temp[j][k]:
                        real.append(temp[j][k] * 2)
                        max_val = max(temp[j][k] * 2, max_val)
                        t = -1
                    else:
                        real.append(t)
                        t = temp[j][k]
            if t != -1:
                real.append(t)
            for k in range(len(temp) - len(real)):
                real.append(0)
            after.append(real)
    else:
        t_t = [[0 for _ in range(n)] for _ in range(n)]
        for j in range(n):  # 열
            t = -1
            real = []
            for i in range(n):
                if temp[i][j] == 0:
                    continue
                if t == -1:
                    t = temp[i][j]
                else:
                    if t == temp[i][j]:
                        real.append(temp[i][j] * 2)
                        max_val = max(temp[i][j] * 2, max_val)
                        t = -1
                    else:
                        real.append(t)
                        t = temp[i][j]
            if t != -1:
                real.append(t)
            for i in range(len(real)):
                t_t[i][j] = real[i]
        after = t_t
        if after == check_board:
            after == board
    return after
allCase([], 0)

for i in range(len(total)):
    board = test_board
    for j in range(5):
        board = moveBlock(board,total[i][j])

print(max_val)
