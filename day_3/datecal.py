#연도 월 일을 입력받아서 그날이 그해의 몇번째 날인지 맞추기
#윤년도 생각하기
#윤년 = 4의 배수가 되면서 100의 배수가 되면 안되고 400의 배수
#윤년의 경우 2월이 29일 윤년이 아니면 28일
m = [0,31,28,31,30,31,30,31,31,30,31,30,31]
total = 0
#윤년 구하기
year = int(input("연도 "))

#and, or, not : 논리연산자  결과는 True 또는 False
# 조건 1 and 조건 2 : 두 개의 조건 모두 참이면 참 아니면 거짓
# 조건 1 or 조건 2 : 두 개의 조건 중 하나라도 참이면 참 아니면 거짓
# not 조건 : 참을 거짓으로 거짓을 참으로
# 우선순위 : not->and->or 순으로 적용됨

month = int(input("월 "))
date = int(input("일 "))

if year%4 == 0 and year%100!=0 or year%400==0:
    print("윤년")
    m[2]=29
else:
    print("윤년 아님")
    
total = total + date 

for i in range(1,month):
    total = total + m[i]


print(total)


    


