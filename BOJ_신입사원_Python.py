import sys
input = sys.stdin.readline
t = int(input())
for _ in range(t):
    n = int(input())
    grade = [0 for _ in range(n)]
    for _ in range(n):
        temp = list(map(int,input().split()))
        grade[temp[0]-1] = temp[1]
    count = 1
    cur = grade[0]
    for i in range(1,n):
        if grade[i] < cur:
            count += 1
            cur = grade[i]
    print(count)