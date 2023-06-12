#미터를 입력받아 km 와 m 구하기

x= int(input("x="))

k = x//1000
m = x%1000

print(f"{x}m는 {k}km와 {m}m 입니다")
print()

#섭씨온도를 입력받아 화씨온도 구하기

a = int(input("a="))
b = (a*9/5)+32

print(f"섭씨 {a}도는 화씨 {b}도입니다")
print()

#5명의 더치페이 금액 구하기
#주문내용 김찌 8000 , 된찌 7000, 제육 10000 

m1 = 8000
m2 = 7000
m3 = 10000
v = int(input("김치찌개 몇명? "))
z = int(input("된장찌개 몇명? "))
y = int(input("제육볶음 몇명? "))

sum = (m1*v) + (m2*z) + (m3*y)
cnt = v+z+y

print(f"총액 {sum}원, 1인당 {sum//cnt}원씩 내면 됨")

#돈 거슬러주기
#돈을 입력받고 각종 단위별 갯수

cash = int(input("c="))

x1 = cash//50000
cash = cash%50000

x2 = cash//10000
cash = cash%10000

x3 = cash//5000
cash = cash%5000

x4 = cash//1000
cash = cash%1000

x5 = cash//500
cash = cash%500

x6 = cash//100
cash = cash%100

x7 = cash//50
cash = cash%50

x8 = cash//10

print("50000원 {0}장, 10000원 {1}장, 5000원 {2}장, 1000원 {3}장, 500원 {4}개, 100원 {5}개, 50원 {6}개, 10원 {7}개"
      .format(x1,x2,x3,x4,x5,x6,x7,x8))




