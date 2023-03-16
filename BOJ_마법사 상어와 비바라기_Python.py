import sys
from collections import deque
input = sys.stdin.readline
n,m = map(int,input().split())

basket = []
cloud = deque()
cloud = [(n-1,0),(n-1,1),(n-2,0),(n-2,1)]
cloud = deque(cloud)
def copyWater(cloud):
    D = [(1,1),(1,-1),(-1,1),(-1,-1)]
    for point in cloud:
        for i in range(4):
            newX = point[0] + D[i][0]
            newY = point[1] + D[i][1]
            if newX < 0 or newY < 0 or newX >= n or newY >= n:
                continue
            if basket[newX][newY] != 0:
                basket[point[0]][point[1]] += 1
def magic(d,s):
    global cloud
    D = [(0,-1),(-1,-1),(-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1)]

    print("이전 구름 위치", cloud)
    print("구름 이동 전 바구니",basket)
    for _ in range(len(cloud)):
        # a = cloud[0]; cloud.popleft()
        x,y = cloud.popleft()
        tempX = x + (D[d - 1][0] * s)
        tempY = y + (D[d - 1][1] * s)
        if tempX < 0:
            tempX += n
        if tempY < 0:
            tempY += n
        newX = tempX % n; newY = tempY % n
        print("@@@@@@@@@",cloud)
        cloud.append((newX,newY))
        print("============",(cloud))
        basket[newX][newY] += 1
        check[newX][newY] = 1
    print("이동 후 구름 위치",cloud)
    print("마법 전 및 이동 후 바구니",basket)
    # addWater(cloud)
    copyWater(cloud)
    print("물 복사 후 바구니",basket)
for _ in range(n):
    basket.append(list(map(int,input().split())))
for _ in range(m):
    d,s = map(int,input().split())
    check = [[0] * n for _ in range(n)]
    magic(d,s)
    temp = deque()
    for i in range(n):
        for j in range(n):
            if basket[i][j] >= 2 and check[i][j] == 0:
                temp.append((i,j))
                basket[i][j] -= 2
    cloud = temp
    print("끝나고난 뒤 최종 바구니", basket)
result = 0
for i in range(n):
    for j in range(n):
        result += basket[i][j]
print(result)