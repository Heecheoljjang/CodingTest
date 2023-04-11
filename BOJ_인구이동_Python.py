from collections import deque
n,l,r = map(int,input().split())
people = []
d = [(1,0),(0,1),(-1,0),(0,-1)]
for _ in range(n):
    people.append(list(map(int,input().split())))
count = 0
def check(x,y,t_ch):
    global visited, people
    queue = deque()
    queue.append((x,y))
    temp = []
    sum = people[x][y]
    while queue:
        cur = queue.popleft()
        for i in range(4):
            new = (cur[0]+d[i][0],cur[1]+d[i][1])
            if new[0] < 0 or new[1] < 0 or new[0] >= n or new[1] >= n:
                continue
            if visited[new[0]][new[1]] == 1:
                continue
            dif = abs(people[cur[0]][cur[1]] - people[new[0]][new[1]])
            if dif >= l and dif <= r:
                temp.append(new)
                queue.append(new)
                visited[new[0]][new[1]] = 1
                sum += people[new[0]][new[1]]
    if len(temp) != 0:
        n_p = sum // (len(temp) + 1)
        for c in temp:
            people[c[0]][c[1]] = n_p
        people[x][y] = n_p
        return True
    if t_ch:
        return True
    else:
        return False
while True:
    visited = [[0 for _ in range(n)] for _ in range(n)]
    ch = False
    for i in range(n):
        for j in range(n):
            if visited[i][j] == 0:
                visited[i][j] = 1
                ch = check(i,j,ch)
    if not ch:
        break
    count += 1
print(count)