board = []
for _ in range(9):
    board.append(list(map(int,input())))

row = [[0 for _ in range(9)] for _ in range(9)]
col = [[0 for _ in range(9)] for _ in range(9)]
box = [[0 for _ in range(9)] for _ in range(9)]

for i in range(9):
    for j in range(9):
        if board[i][j] != 0:
            row[i][board[i][j] - 1] = 1
            col[j][board[i][j] - 1] = 1
            box[(i//3) * 3 + j // 3][board[i][j] - 1] = 1

def dfs(t_board,count, r,c,b):
    if count == 81:
        for temp in t_board:
            print(''.join(map(str,temp)))
        exit(0)
    t = []
    t_row = []
    t_col = []
    t_box = []
    for i in range(len(r)):
        t_row.append(r[i])
        t_col.append(c[i])
        t_box.append(b[i])
    for i in range(9):
        t.append(t_board[i])
    cur = (count // 9,count % 9)
    if t[cur[0]][cur[1]] != 0:
        dfs(t,count+1,t_row,t_col,t_box)
    else:
        for i in range(9):
            if row[cur[0]][i] != 1 and col[cur[1]][i] != 1 and box[(cur[0] // 3) * 3 + cur[1]//3][i] != 1:
                row[cur[0]][i] = 1
                col[cur[1]][i] = 1
                box[(cur[0] // 3) * 3 + cur[1] // 3][i] = 1
                t[cur[0]][cur[1]] = i + 1
                dfs(t,count+1,t_row,t_col,t_box)
                row[cur[0]][i] = 0
                col[cur[1]][i] = 0
                box[(cur[0] // 3) * 3 + cur[1] // 3][i] = 0
                t[cur[0]][cur[1]] = 0
dfs(board,0,row,col,box)

