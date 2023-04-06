import sys
input = sys.stdin.readline
t = int(input().rstrip())
for _ in range(t):
    n = int(input().rstrip())
    numbers = []
    for _ in range(n):
        numbers.append(input().rstrip())
    numbers.sort()
    check = True
    for i in range(len(numbers) - 1):
        if numbers[i] == numbers[i+1][:len(numbers[i])]:
            check = False
            break
    if check:
        print("YES")
    else:
        print("NO")