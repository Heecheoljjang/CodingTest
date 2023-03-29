import sys
from collections import deque
input = sys.stdin.readline
n,m,k = map(int,input().split())
a = []
d = [(1,0),(0,1),(-1,0),(0,-1),(1,1),(1,-1),(-1,1),(-1,-1)]
for _ in range(n):
    a.append(list(map(int,input().split())))
r = len(a)
c = len(a[0])
ground = [[5 for _ in range(c)] for _ in range(r)]
cur = [[[]for _ in range(c)] for _ in range(r)]
result = 0
for _ in range(m):
    x,y,age = map(int,input().split())
    x -= 1; y -= 1 #1부터 시작하므로
    cur[x][y].append(age)
    result += 1
for _ in range(k):
    #봄,여름
    for i in range(r):
        for j in range(c):
            trees = cur[i][j]
            if len(trees) == 0:
                continue
            #나무가 있는 상태
            temp = deque()
            dead = 0
            while trees:
                cur_tree = trees.pop()  # cur_tree는 나이
                if cur_tree > ground[i][j]:
                    dead += cur_tree // 2
                    result -= 1
                else:
                    ground[i][j] -= cur_tree
                    temp.appendleft(cur_tree + 1)
            cur[i][j] = temp
            ground[i][j] += dead
    #가을,겨울
    for i in range(r):
        for j in range(c):
            ground[i][j] += a[i][j]
            if len(cur[i][j]) != 0:
                for tree in cur[i][j]:
                    if tree % 5 == 0 and tree != 0:
                        for p in range(8):
                            nx = i + d[p][0]
                            ny = j + d[p][1]
                            if nx < 0 or ny < 0 or nx >= r or ny >= c:
                                continue
                            cur[nx][ny].append(1)
                            result += 1
print(result)