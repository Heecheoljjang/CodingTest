import sys
input = sys.stdin.readline
board = [[False for _ in range(101)] for _ in range(101)]
result = []
n = int(input())
count = 0
def rotate(base,x,y):
    # print(base,x,y)
    #x,y => y,-x
    x -= base[0]
    y -= base[1]
    nx = base[0] + y
    ny = base[1] - x
    if nx < 0 or ny < 0:
        return
    return (nx, ny)
for _ in range(n):
    x, y, d, g = map(int,input().split())
    if d == 0:
        dragon = [(y,x),(y,x+1)]
    elif d == 1 and y >= 1:
        dragon = [(y, x), (y - 1,x)]
    elif d == 2 and x >= 1:
        dragon = [(y, x), (y, x - 1)]
    else:
        dragon = [(y, x), (y + 1,x)]
    base = dragon[-1]
    result += dragon

    for _ in range(g):
        for i in range(len(dragon)):
            new = rotate(base,dragon[i][0],dragon[i][1])
            if new == None:
                continue
            dragon.append(new)
            result.append(new)
        base = rotate(base,y,x)
    # print("최종 드래곤", dragon)
result = set(result)
for i in range(101):
    for j in range(101):
        if i + 1 < 101 and j + 1 < 101:
            if (i,j) in result and (i + 1, j + 1) in result and (i + 1,j) in result and (i,j + 1) in result:
                count += 1
print(count)