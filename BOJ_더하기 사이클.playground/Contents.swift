let N = 55
var newNum: Int
var count = 0

newNum = (N % 10) * 10 + (N / 10 + N % 10) % 10
count += 1

while newNum != N {
    newNum = (newNum % 10) * 10 + (newNum / 10 + newNum % 10) % 10
    count += 1
}
print(count)
