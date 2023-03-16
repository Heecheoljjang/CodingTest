import sys
input = sys.stdin.readline
d = [(1,0),(-1,0),(0,1),(0,-1)]
n = int(input())
seats = [[0 for _ in range(n)] for _ in range(n)]
students = {}
for _ in range(n * n):
    temp = list(map(int,input().split()))
    student = temp[0]; likeList = temp[1:]
    students[student] = likeList
    print(student, likeList)
    available = [] # (x,y,좋아하는수,빈칸수)
    for i in range(n):
        for j in range(n):
            if seats[i][j] == 0:
                #비어있는 칸이므로 주변에 비어있는칸과 좋아하는 수 확인후에 available에 넣기
                emptyCount = 0; likeCount = 0
                for k in range(4):
                    newX = i + d[k][0]; newY = j + d[k][1]
                    if newX < 0 or newY < 0 or newX >= n or newY >= n:
                        continue
                    if seats[newX][newY] == 0:
                        emptyCount += 1
                    elif seats[newX][newY] in likeList:
                        likeCount += 1
                available.append((i,j,likeCount,emptyCount))
    print("정렬 전", available)
    available.sort(key=lambda n: (n[2],n[3],-n[0],-n[1]),reverse=True)
    print("정렬 후", available)
    seats[available[0][0]][available[0][1]] = student
    print(seats)
print(students)
sum = 0
for i in range(n):
    for j in range(n):
        count = 0
        for k in range(4):
            newX = i + d[k][0]; newY = j + d[k][1]
            if newX < 0 or newY < 0 or newX >= n or newY >= n:
                continue
            if seats[newX][newY] in students[seats[i][j]]:
                count += 1
        if count == 1:
            sum += 1
        elif count == 2:
            sum += 10
        elif count == 3:
            sum += 100
        elif count == 4:
            sum += 1000
print(sum)