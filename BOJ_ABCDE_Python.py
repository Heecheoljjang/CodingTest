import sys
input = sys.stdin.readline
n,m = map(int,input().split())
f = {}
for _ in range(m):
    a, b = map(int,input().split())
    if a in f:
        f[a].append(b)
    else:
        f[a] = [b]
    if b in f:
        f[b].append(a)
    else:
        f[b] = [a]
visited = [0 for _ in range(n)]
def dfs(f_list):
    # t_visited = []
    # for i in range(len(visited)):
    #     t_visited.append(visited[i])
    if len(f_list) == 5:
        # print(f_list)
        print(1)
        exit(0)
    if f_list[-1] in f:
        for i in f[f_list[-1]]:
            if visited[i] == 0:
                visited[i] = 1
                dfs(f_list + [i])
                visited[i] = 0

for i in range(n):
    # t_visited = []
    # for j in range(n):
    #     t_visited.append(visited[j])
    if visited[i] == 0:
        visited[i] = 1
        dfs([i])
        visited[i] = 0
print(0)
