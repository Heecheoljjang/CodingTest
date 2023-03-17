import sys
input = sys.stdin.readline
n,m,x,y,k = map(int,input().split())
board = []
for _ in range(n):
    board.append(list(map(int,input().split())))
# [1,2,3,4,5,6] 위 앞 오 왼 뒤 아
dice = [0 for _ in range(6)]
def rollDice(dir,cur):
    global dice, x, y, check
    if dir == 1:
        if y + 1 == m:
            check = True
            return
        y += 1
        # [4,2,1,6,5,3]
        dice = [cur[3],cur[1],cur[0],cur[5],cur[4],cur[2]]
    elif dir == 2:
        if y == 0:
            check = True
            return
        y -= 1
        # [3,2,6,1,5,4]
        dice = [cur[2], cur[1], cur[5], cur[0], cur[4], cur[3]]
    elif dir == 3:
        if x == 0:
            check = True
            return
        x -= 1
        # [5,1,3,4,6,2]
        dice = [cur[4], cur[0], cur[2], cur[3], cur[5], cur[1]]
    else:
        if x + 1 == n:
            check = True
            return
        x += 1
        # [2,6,3,4,1,5]
        dice = [cur[1], cur[5], cur[2], cur[3], cur[0], cur[4]]

def changeNum(x,y):
    global board, dice

    if board[x][y] == 0:
        board[x][y] = dice[5]
    else:
        dice[5] = board[x][y]
        board[x][y] = 0
print("처음 보드",board)
print("처음 주사위",dice)
changeNum(x,y)
command = list(map(int,input().split()))
print("한 번 후 보드",board)
print("한 번 후 주사위",dice)
for i in range(len(command)):
    check = False
    rollDice(command[i],dice)
    if check:
        continue
    else:
        changeNum(x, y)
        print(dice[0])
