import sys
input = sys.stdin.readline
t = int(input())
for _ in range(t):
    n = int(input())
    selected = list(map(int,input().split()))
    # print("selecte", selected)
    check = [False for _ in range(n)]
    count = 0
    for i in range(n):
        if not check[i]:
            temp = [i]
            t = i
            check[i] = True
            while True:
                if not check[selected[t]-1]:
                    temp.append(selected[t]-1)
                    check[selected[t]-1] = True
                    t = selected[t]-1
                else:
                    t = selected[t]-1
                    break
            for s in temp:
                if s == t:
                    break
                count += 1
    print(count)