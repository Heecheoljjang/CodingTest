first = list(input())
second = list(input())
val = 0
result = [[0 for _ in range(len(second))] for _ in range(len(first))]
for i in range(len(first)):
    for j in range(len(second)):
        if first[i] == second[j]:
            if i - 1 < 0 or j - 1 < 0:
                result[i][j] = 1
            else:
                result[i][j] = result[i-1][j-1] + 1
            val = max(val,1,result[i][j])
print(val)