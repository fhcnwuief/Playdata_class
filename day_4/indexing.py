#변수가 배열형태로 저장될 때 다 갖고 있다
#list, tuple, str(문자열)

s1 = "아메리카노,에스프레소,카페라떼,카라멜마끼아또"

print(s1[0])
print(s1[1])
print(s1[2])
print(s1[6],s1[7],s1[8],s1[0],s1[10])

#str, tuple 둘 다 readonly ->인덱싱을 통한 값 변경은 불가
#슬라이싱[시작:종료:증감치] 
#시작과 종료 값을 생략할 경우 처음부터 마지막까지 라는 의미

#0,2,4,6,8
print(s1[::2])
#0~4 잘라내기
print(s1[:5])
print(s1[6:11])
print(s1[::-1])

s2 = s1[6:11]
print(s2)


#토큰분리 : split 함수는 반환값이 list 타입, 문자열에서 특정 문자 기준으로 잘라냄
wordList = s1.split(",")
print(wordList)

#연결할 문자열.join(리스트타입)
s2 = " ".join(wordList)
print(s2)

s2 = ",".join(wordList)
print(s2)

#문자열은 한번 값이 정해지면 자체는 수정 불가
#문자열 수정 = 잘라서 넣고 그 뒤에부터 저장
s1 = "hello, python"
print(s1)
s1 = "H"+s1[1:] #"H ello,python" 합쳐진 문자가 다시 s1으로 전달
print(s1)
s1 = "hello, python"
s1 = s1[:7]+ "P" +s1[8:]
print(s1)


colorList = ["red","white","green","cyan","magenta","violet","blue"]

print(colorList[0])
print(colorList[2])
print(colorList[4])
print(colorList[5])

print(colorList[:4])
print(colorList[4::-1])

#각 첫글자만 대문자로 바꿔서 출력
for i in range(0,len(colorList)):
    colorList[i]=chr(ord(colorList[i][0])-32) + colorList[i][1:]
print(colorList)

for i in range(0,len(colorList)):
    colorList[i]=colorList[i].capitalize()
print(colorList)

# for i in range(0,len(colorList)):
#     colorList[i]=colorList[i].capitalize()+colorList[1:]
# print(colorList)

#데이터 추가 수정 삭제
colorList.append("Black")
#위치 지정 가능
colorList.insert(0,"yellow")
print(colorList)

#수정
colorList[0]="Yellow" 
print(colorList)

#삭제 - 값으로
colorList.remove("Red")
#인덱스 값으로 삭제
del colorList[5]
print(colorList)