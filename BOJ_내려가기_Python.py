import sys
input = sys.stdin.readline
n = int(input())
t = [(0,0) for _ in range(3)]
for i in range(1,n+1):
    temp = list(map(int,input().split()))
    firstMin = min(t[0][0],t[1][0]) + temp[0]
    firstMax = max(t[0][1],t[1][1]) + temp[0]
    secondMin = min(t[0][0],t[1][0],t[2][0]) + temp[1]
    secondMax = max(t[0][1],t[1][1],t[2][1]) + temp[1]
    thirdMin = min(t[1][0],t[2][0]) + temp[2]
    thirdMax = max(t[1][1],t[2][1]) + temp[2]
    t = [(firstMin,firstMax),(secondMin,secondMax),(thirdMin,thirdMax)]
print(max(t[0][1],t[1][1],t[2][1]),min(t[0][0],t[1][0],t[2][0]))