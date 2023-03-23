n, l = map(int,input().split())
board = []
result = 0
for _ in range(n):
    board.append(list(map(int,input().split())))
for i in range(n):
    cur_h = board[i][0]
    check = True
    visited = [False] * n
    for j in range(1,n):
        if cur_h == board[i][j]:
            continue
        else:
            if abs(cur_h - board[i][j]) > 1:
                check = False
                break
            else:
                l_check = True
                if cur_h > board[i][j]:
                    temp = board[i][j]
                    #내려갈때
                    if j + l > n:
                        check = False
                        break
                    for k in range(j,j + l):
                        if board[i][k] != temp or visited[k]:
                            l_check = False
                            break
                    if not l_check:
                        check = False
                        break
                    for k in range(j,j + l):
                        visited[k] = True
                    cur_h = temp
                else:
                    temp = board[i][j - 1]
                    #올라갈때
                    if j - l < 0:
                        check = False
                        break
                    for k in range(j - l,j):
                        if board[i][k] != temp or visited[k]:
                            l_check = False
                            break
                    if not l_check:
                        check = False
                        break
                    for k in range(j - l,j):
                        visited[k] = True
                    cur_h = board[i][j]
    if check:
        result += 1
for i in range(n):
    cur_h = board[0][i]
    check = True
    visited = [False] * n
    for j in range(1,n):
        if cur_h == board[j][i]:
            continue
        else:
            if abs(cur_h - board[j][i]) > 1:
                check = False
                break
            else:
                l_check = True
                if cur_h > board[j][i]:
                    temp = board[j][i]
                    # 내려갈때
                    if j + l > n:
                        check = False
                        break
                    for k in range(j, j + l):
                        if board[k][i] != temp or visited[k]:
                            l_check = False
                            break
                    if not l_check:
                        check = False
                        break
                    for k in range(j, j + l):
                        visited[k] = True
                    cur_h = temp
                else:
                    temp = board[j - 1][i]
                    # 올라갈때
                    if j - l < 0:
                        check = False
                        break
                    for k in range(j - l, j):
                        if board[k][i] != temp or visited[k]:
                            l_check = False
                            break
                    if not l_check:
                        check = False
                        break
                    for k in range(j - l, j):
                        visited[k] = True
                    cur_h = board[j][i]
    if check:
        result += 1
print(result)