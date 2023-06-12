#튜플 - 사용법이 리스트와 유사하다. 단 읽기전용 메모리. 값 수정 안됨
#아무때나 대충 데이터 묶어서 데리고 다닐때, list타입보다 속도가 빠르다
#읽기 indexing 지원, 슬라이싱 지원 내용 못바꿈
#[] - list  () - tuple

fruits=("사과","배","딸기","포도")
print(fruits)
print(type(fruits)) #타입 출력
print(fruits[0])
print(fruits[1])
print(fruits[0:3])
print(fruits[::-1])

#fruits[0]="망고" <- 값 변경 불가
#fruits.append("망고")
#fruits.remove("사과") - 추가 수정 삭제 불가


name="홍길동"
age=12
phone = "010-0000-0000"
kor = 90
#str - 클래스, 파이썬이 제공하는 데이터 타입
# s1 = str.format("이름 : %s 나이 : %s 전화번호 : %s" %(name,age,phone))
# print(s1)

# s1 = str.format("이름:%s 국어:%d 영어:%d 수학:%d" % ("임꺽정",90,70,80))
# print(s1)

a=10
#변수 3개를 한번에 초기화
# 시스템 내부에서 tuple 사용중
a,b,c = 10,20,30
print(a)
print(b)
print(c)


# 두 변수의 값을 맞바꾸고자 함
a=5
b=7

temp = a
a=b
b=temp
print(f"a={a} b={b}")

a=5
b=7
a,b=b,a
print(f"a={a} b={b}")

for i in fruits:
    print(i)

#튜플은 주로 함수와 관련되어 사용됨
