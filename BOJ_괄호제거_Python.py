ex = list(input())
check = list()
d = list()
for i in range(len(ex)):
    if ex[i] == "(":
        d.append(i)
    elif ex[i] == ")":
        check.append((d.pop(),i))
t = []
result = set()
def getTotal(arr, idx, target):
    if len(arr) == target:
        t.append(arr)
        return
    for i in range(idx,len(check)):
        getTotal(arr+[check[i]], i+1, target)
for i in range(1,len(check) + 1):
    getTotal([],0,i)
for case in t:
    temp = ex[:]
    for j in case:
        temp[j[0]] = ''
        temp[j[1]] = ''
        result.add(''.join(temp))
new = list(set(result))
new.sort()
for c in new:
    print(c)