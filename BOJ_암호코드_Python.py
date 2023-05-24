password = list(map(int, input()))
r = [0 for _ in range(len(password) + 1)]
if password[0] == 0:
    print(0)
else:
    password = [0] + password
    r[0], r[1] = 1, 1
    for i in range(2, len(password)):
        if password[i] != 0:
            r[i] = r[i - 1]
            temp = password[i - 1] * 10 + password[i]
            if temp >= 10 and temp <= 26:
                r[i] += r[i - 2]
        else:
            temp = password[i - 1] * 10 + password[i]
            if temp >= 10 and temp <= 26:
                r[i] = r[i - 2]
            else:
                print(0)
                exit(0)
    print(r[len(password)-1] % 1000000)