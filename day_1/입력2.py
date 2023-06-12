#fstring 방식

x = int(input("x="))
y = int(input("y="))


print(f"{x}+{y}={x+y}")
print(f"{x}-{y}={x-y}")
print(f"{x}*{y}={x*y}")
print(f"{x}/{y}={x/y}")
print(f"{x}//{y}={x//y}")
print(f"{x}%{y}={x%y}")
print(f"{x}**{y}={x**y}")



# 이름, 국어 영어 수학 입력받고 평균

name = input("name = ")
kor = int(input("kor = "))
eng = int(input("eng = "))
math = int(input("math = "))

sum = kor+eng+math

print(name+"의 총점은 "+str(sum)+"이고 평균은 "+str(sum/3)+"입니다")
print("{0}의 총점은 {1}이고 평균은 {2}입니다".format(name,sum,sum/3))
print(f"{name}의 총점은 {sum}이고 평균은 {sum/3}입니다")