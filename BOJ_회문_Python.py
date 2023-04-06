import sys
input = sys.stdin.readline
t = int(input())
for _ in range(t):
    word = input().rstrip()
    start = 0
    end = len(word) - 1
    count = 0
    while start < end:
        #다르면 이후꺼 확인해보고 같은쪽 지워주기
        if word[start] != word[end]:
            if count == 1:
                count = 2
                break
            if word[start + 1] == word[end] and word[start] != word[end - 1]:
                count += 1
                start += 1
                continue
            elif word[start] == word[end - 1] and word[start+1] != word[end]:
                count += 1
                end -= 1
                continue
            elif word[start+1] == word[end] and word[start] == word[end-1]:
                #start쪽 제거하는 경우
                f_count = count + 1
                f_start = start + 1
                f_end = end
                while f_start < f_end:
                    if word[f_start] != word[f_end]:
                        f_count += 1
                        break
                    f_start += 1
                    f_end -= 1
                #end쪽 제거하는 경우
                s_count = count + 1
                s_start = start
                s_end = end - 1
                while s_start < s_end:
                    if word[s_start] != word[s_end]:
                        s_count += 1
                        break
                    s_start += 1
                    s_end -= 1
                if f_count == 2 and s_count == 2:
                    count = 2
                else:
                    count = 1
                break
            else:
                count = 2
                break
        start += 1
        end -= 1
    print(count)