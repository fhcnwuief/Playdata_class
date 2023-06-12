words = ["school","assembly","chair","hospital","desk","rain","rainbow"]
print(words)
print()
print("데이터 개수 : ",len(words))
print()
#인덱싱
print(words[0])
print(words[1])
print(words[2])
print()
words[3]="house"
print(words)
print()
for w in words:
    print(w)
    

#슬라이싱 - 파이썬 이후로 등장하는 문법  리스트변수[시작:종료:증감치]
#마지막 생략하면 증가폭 1
print(words[0:3]) 
print(words[0:5:2])

#뒤에서부터 출력
print(words[6:3:-1])

#완전히 역순으로
print(words[::-1])

print(words[6:0:-1]) #마지막 0번째는 출력되지 않는데 전체를 역순으로 출력하려면 [::-1]을 사용
