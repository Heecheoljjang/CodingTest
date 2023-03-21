import sys
input = sys.stdin.readline

n = int(input())
board = []
result = 0
left = [(1,1,0.01),(1,0,0.07),(1,-1,0.1),(2,0,0.02),(-1,1,0.01),(-1,0,0.07),(-1,-1,0.1),(-2,0,0.02),(0,-2,0.05),(0,-1,1)]
right = [(x,-y,z) for x,y,z in left]
up = [(y,x,z) for x,y,z in left]
down = [(-y,x,z) for x,y,z in left]
dir = [1,2,3,4]
moving = []
sx,sy = n // 2, n // 2

for _ in range(n):
    board.append(list(map(int,input().split())))

#왼 1 , 아 2 , 오 3 , 위 4
def getDir():
    global moving
    count = 1
    while True:
        check = 0
        for i in dir:
            if check % 2 == 0 and check != 0 :
                count += 1
                check = 0
            for _ in range(count):
                moving.append(i)
                if len(moving) == n * n - 1:
                    return
            check += 1
        count += 1
getDir()
print(moving)
def magic():
    global sx, sy, result
    for i in range(len(moving)):
        print(sx, sy)
        print(result)
        temp = 0
        if moving[i] == 1:
            tx = sx
            ty = sy - 1
            cur = board[tx][ty]
            board[tx][ty] = 0
            print("방향은 ", moving[i])
            for j in range(len(left)):
                nx = tx + left[j][0]
                ny = ty + left[j][1]
                # print("nx ny", nx, ny)
                if nx < 0 or ny < 0 or nx >= n or ny >= n:
                    if j == 9:
                        result += int(cur * left[j][2]) - temp
                    else:
                        temp += int(cur * left[j][2])
                        result += int(cur * left[j][2])
                else:
                    if j == 9:
                        board[nx][ny] += cur - temp
                    else:
                        board[nx][ny] += int(cur * left[j][2])
                        temp += int(cur * left[j][2])
                # for a in board:
                #     print(a)
            sy -= 1
        elif moving[i] == 2:
            tx = sx + 1
            ty = sy
            cur = board[tx][ty]
            board[tx][ty] = 0
            print("방향은 ", moving[i])
            for j in range(len(left)):
                nx = tx + down[j][0]
                ny = ty + down[j][1]
                # print("nx ny", nx, ny)
                if nx < 0 or ny < 0 or nx >= n or ny >= n:
                    if j == 9:
                        result += int(cur * down[j][2]) - temp
                    else:
                        temp += int(cur * down[j][2])
                        result += int(cur * down[j][2])
                else:
                    if j == 9:
                        board[nx][ny] += cur - temp
                    else:
                        board[nx][ny] += int(cur * down[j][2])
                        temp += int(cur * down[j][2])
                # for a in board:
                #     print(a)
            sx += 1
        elif moving[i] == 3:
            tx = sx
            ty = sy + 1
            cur = board[tx][ty]
            board[tx][ty] = 0
            print("방향은 ", moving[i])
            for j in range(len(left)):
                nx = tx + right[j][0]
                ny = ty + right[j][1]
                # print("nx ny", nx, ny)
                if nx < 0 or ny < 0 or nx >= n or ny >= n:
                    if j == 9:
                        result += int(cur * right[j][2]) - temp
                    else:
                        temp += int(cur * right[j][2])
                        result += int(cur * right[j][2])
                else:
                    if j == 9:
                        board[nx][ny] += cur - temp
                    else:
                        board[nx][ny] += int(cur * right[j][2])
                        temp += int(cur * right[j][2])
                # for a in board:
                #     print(a)
            sy += 1
        else:
            tx = sx - 1
            ty = sy
            cur = board[tx][ty]
            board[tx][ty] = 0
            print("방향은 ", moving[i])
            for j in range(len(left)):
                nx = tx + up[j][0]
                ny = ty + up[j][1]
                # print("nx ny", nx, ny)
                if nx < 0 or ny < 0 or nx >= n or ny >= n:
                    if j == 9:
                        result += int(cur * up[j][2]) - temp
                    else:
                        temp += int(cur * up[j][2])
                        result += int(cur * up[j][2])
                else:
                    if j == 9:
                        board[nx][ny] += cur - temp
                    else:
                        board[nx][ny] += int(cur * up[j][2])
                        temp += int(cur * up[j][2])
                # for a in board:
                #     print(a)
            sx -= 1
        for a in board:
            print(a)
        print("현재 토네이도 위치 ", sx, sy)
magic()
print(int(result))