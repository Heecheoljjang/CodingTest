t = int(input())
for i in range(t):
    result = 0
    n = int(input())
    numbers = list(map(int,input().split()))[::-1]
    max_value = numbers[0]
    for num in numbers:
        if num > max_value:
            max_value = num
            continue
        elif num < max_value:
            result += max_value - num
    print(f"#{i + 1}",result)