#음수가 입력될때가지 입력 받아서 짝수 홀수 구분해서 짝수 합 홀수 합
i = int(input("i="))
sum1 = 0
sum2 = 0
while i>=0:
    if i%2==0:
        sum1 = sum1 + i
    else:
        sum2 = sum2 + i
    i = int(input("i="))
    
    
print(f"짝수 합 = {sum1}, 홀수 합 = {sum2}")



#음수가 입력될때가지 입력받아서 짝수와 홀수를 구분 분리시켜 다른 리스트에 담아 한번에 출력

z = int(input("z="))
num1 = []
num2 = []
while z>=0:
    if z%2==0:
        num1.append(z)
    else:
        num2.append(z)
    z = int(input("z="))

print(num1)
print(num2)