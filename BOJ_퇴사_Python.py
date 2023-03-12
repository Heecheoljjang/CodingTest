n = int(input())
data = []
for _ in range(n):
    data.append(list(map(int,input().split())))
result = [0 for _ in range(80)]
for i in range(n, 0, -1):
    if i + data[i - 1][0] > n + 1:
        result[i] = result[i + 1]
    else:
        result[i] = max(result[i + 1], result[i + data[i - 1][0]] + data[i - 1][1])
print(result[1])