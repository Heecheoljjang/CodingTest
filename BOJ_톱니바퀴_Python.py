gears = []
datas = []
for _ in range(4):
    gears.append(input())
k = int(input())
for _ in range(k):
    datas.append(list(map(int,input().split())))

def getChangingGears(num):
    if num == 1:
        if gears[0][2] == gears[1][6]:
            return [1]
        else:
            if gears[1][2] == gears[2][6]:
                return [1,2]
            else:
                if gears[2][2] == gears[3][6]:
                    return [1,2,3]
                else:
                    return [1,2,3,4]
    elif num == 2:
        if gears[0][2] == gears[1][6]:
            if gears[1][2] == gears[2][6]:
                return [2]
            else:
                if gears[2][2] == gears[3][6]:
                    return [2,3]
                else:
                    return [2,3,4]
        else:
            if gears[1][2] == gears[2][6]:
                return [1,2]
            else:
                if gears[2][2] == gears[3][6]:
                    return [1,2,3]
                else:
                    return [1,2,3,4]
    elif num == 3:
        if gears[2][2] == gears[3][6]:
            if gears[1][2] == gears[2][6]:
                return [3]
            else:
                if gears[0][2] == gears[1][6]:
                    return [2,3]
                else:
                    return [1,2,3]
        else:
            if gears[1][2] == gears[2][6]:
                return [3,4]
            else:
                if gears[0][2] == gears[1][6]:
                    return [2,3,4]
                else:
                    return [1,2,3,4]
    else:
        if gears[2][2] == gears[3][6]:
            return [4]
        else:
            if gears[1][2] == gears[2][6]:
                return [3,4]
            else:
                if gears[0][2] == gears[1][6]:
                    return [2,3,4]
                else:
                    return [1,2,3,4]

def changeLeft(gear, gearNum):
    new = list(gear)
    first = new[0]
    for i in range(len(new) - 1):
        new[i] = new[i + 1]
    new[7] = first
    gears[gearNum] = ''.join(new)
def changeRight(gear,gearNum):
    new = list(gear)
    last = new[7]
    for i in range(7,0,-1):
        new[i] = new[i - 1]
    new[0] = last
    gears[gearNum] = ''.join(new)
def getGearDir(gearNum, dir):
    if gearNum % 2 == 0:
        return [-dir,dir,-dir,dir]
    else:
        return [dir,-dir,dir,-dir]

for i in range(len(datas)):
    tempDir = getGearDir(datas[i][0],datas[i][1])
    tempGears = getChangingGears(datas[i][0])
    for gear in tempGears:
        if tempDir[gear - 1] == 1:
            changeRight(gears[gear - 1], gear - 1)
        else:
            changeLeft(gears[gear - 1], gear - 1)
result = 0
for i in range(4):
    if gears[i][0] == "1":
        if i == 0:
            result += 1
        elif i == 1:
            result += 2
        elif i == 2:
            result += 4
        else:
            result += 8
print(result)