import sys
input = sys.stdin.readline
n = int(input())
people = list(map(int,input().split()))
b,c = map(int, input().split())

result = 0
for i in range(len(people)):
    result += 1
    if people[i] <= b:
        continue
    rest = people[i] - b
    if rest % c == 0:
        result += rest // c
    else:
        result += (rest // c) + 1
print(result)