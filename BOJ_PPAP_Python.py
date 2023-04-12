ppap = input()
if ppap == "P" or ppap == "PPAP":
    print("PPAP")
else:
    stack = []
    for i in ppap:
        stack.append(i)
        if stack[-4:] == ["P","P","A","P"]:
            for _ in range(3):
                stack.pop()
    if stack == ["P"] or stack == ["P","P","A","P"]:
        print("PPAP")
    else:
        print("NP")
