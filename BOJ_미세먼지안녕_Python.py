import sys
input = sys.stdin.readline

r,c,t = map(int,input().split())
dust = []

d = [(1,0),(0,1),(-1,0),(0,-1)]
for _ in range(r):
    dust.append(list(map(int,input().split())))
check = False
for i in range(r):
    for j in range(c):
        if dust[i][j] == -1:
            cleaner = [(i,j),(i+1,j)]
            check = True
            break
    if check == True:
        break
def spread(x,y):
    global dust, dust_temp
    print("spread하기전")
    for a in dust:
        print(a)
    value = 0
    for i in range(4):
        nx = x + d[i][0]
        ny = y + d[i][1]
        if nx < 0 or ny < 0 or nx >= r or ny >= c:
            continue
        if dust[nx][ny] == -1:
            continue
        value += int(dust[x][y] / 5)
        dust_temp.append((nx,ny,int(dust[x][y] / 5))) #nx, ny에 value만큼 더해주면됨
    dust[x][y] -= value
    print(value)
    print("spread 이후")
    for a in dust:
        print(a)
def clean():
    global dust
    print("공기청정기 돌기 전")
    for a in dust:
        print(a)
    new = []
    # 위쪽
    start = cleaner[0]
    for i in range(start[0] + 1):
        if i == 0:
            new.append(dust[0][1:] + [dust[i + 1][-1]])
        elif i == start[0]:
            new.append([-1,0] + dust[start[0]][1:c - 1])
        else:
            new.append([dust[i - 1][0]] + dust[i][1:c - 1] + [dust[i + 1][-1]])
    #아래쪽
    start = cleaner[1]
    for i in range(start[0],r):
        if i == start[0]:
            new.append([-1,0] + dust[start[0]][1:c - 1])
        elif i == r - 1:
            new.append(dust[r - 1][1:] + [dust[r - 2][-1]])
        else:
            new.append([dust[i + 1][0]] + dust[i][1:c - 1] + [dust[i - 1][-1]])
    dust = new
    print("공기청정기 돈 이후 ")
    for a in dust:
        print(a)

def checkDust():
    count = 0
    for i in range(r):
        for j in range(c):
            if dust[i][j] > 0:
                count += dust[i][j]
    print(count)
for _ in range(t):
    dust_temp = []
    for i in range(r):
        for j in range(c):
            if dust[i][j] > 0:
                print("여기는 퍼짐", i,j)
                spread(i,j)
    print("dustTemp",dust_temp)
    for i in range(len(dust_temp)):
        dust[dust_temp[i][0]][dust_temp[i][1]] += dust_temp[i][2]
    clean()
checkDust()