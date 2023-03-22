import sys
input = sys.stdin.readline

r,c,k = map(int,input().split())
r -= 1
c -= 1
list_a = []
check = False
for _ in range(3):
    list_a.append(list(map(int,input().split())))

def R(list):
    # print("R")
    global list_a
    longCount = 0
    for i in range(len(list_a)):
        if i == 100:
            break
        temp = {}
        for j in range(len(list_a[i])):
            if list_a[i][j] == 0:
                continue
            if list_a[i][j] not in temp:
                temp[list_a[i][j]] = 1
            else:
                temp[list_a[i][j]] += 1
        # print("rrrr dic",temp)
        temp_key = sorted(temp.items(), key=lambda item: (item[1],item[0]))
        temp = []
        for element in temp_key:
            temp.append(element[0])
            temp.append(element[1])
        list_a[i] = temp
        longCount = max(longCount,len(list_a[i]))
    for i in range(len(list_a)):
        if len(list_a[i]) < longCount:
            for _ in range(longCount - len(list_a[i])):
                list_a[i].append(0)

def C(list):
    # print("C")
    global list_a
    longCount = 0
    temp_arr = []
    for i in range(len(list_a[0])):
        if i == 100:
            break
        temp = {}
        for j in range(len(list_a)):
            if list_a[j][i] == 0:
                continue
            if list_a[j][i] not in temp:
                temp[list_a[j][i]] = 1
            else:
                temp[list_a[j][i]] += 1
        # print("cc dic",temp)
        temp_key = sorted(temp.items(), key=lambda item: (item[1], item[0]))
        temp = []
        for element in temp_key:
            temp.append(element[0])
            temp.append(element[1])
        temp_arr.append(temp)
        longCount = max(longCount,len(temp))
    # print("cccccc temp_arr",temp_arr)
    # print("ccccc long",longCount)
    for i in range(len(temp_arr)):
        if len(temp_arr[i]) < longCount:
            for _ in range(longCount - len(temp_arr[i])):
                temp_arr[i].append(0)
    # print("바바바바바바",temp_arr)
    new_arr = []
    for i in range(longCount):
        temp = []
        for j in range(len(temp_arr)):
            temp.append(temp_arr[j][i])
        new_arr.append(temp)
    list_a = new_arr
    # print("최종최종",list_a)
for i in range(101):
    if len(list_a) > r and len(list_a[0]) > c:
        if list_a[r][c] == k:
            check = True
            print(i)
            break
    row_count = len(list_a)
    col_count = len(list_a[0])
    if row_count >= col_count:
        R(list_a)
    else:
        C(list_a)
    # print(list_a)
if not check:
    print(-1)
