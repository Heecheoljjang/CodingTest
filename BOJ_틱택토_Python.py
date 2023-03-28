check = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
while True:
    test = list(map(str,input()))
    if len(test) == 3:
        break
    count = 0
    print(test)
    temp = []
    winner = []
    #맞은게 있는지
    for num in check:
        if test[num[0]] == test[num[1]] == test[num[2]] and test[num[0]] != ".":
            count += 1
            winner.append(test[num[0]])
            for i in range(3):
                temp.append(num[i])
    print("winner", winner)
    if count > 2:
        print("invalid")
        continue
    if count == 2 and len(temp) == len(set(temp)):
        print("invalid")
        continue
    x_count = 0
    o_count = 0
    for i in range(len(test)):
        if test[i] == "X":
            x_count += 1
        elif test[i] == "O":
            o_count += 1
    if o_count > x_count:
        print("invalid")
        continue
    if len(winner) == 0:
        if x_count + o_count == 9:
            print("valid")
        else:
            print("invalid")
        continue
    if winner[0] == "O" and x_count != o_count:
        print("invalid")
        continue
    if winner[0] == "X" and x_count <= o_count:
        print("invalid")
        continue
    if x_count - o_count > 1:
        print("invalid")
        continue
    print("valid")
