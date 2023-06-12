numbers = [273,103,5,32,65,9,72,800,99]

for number in numbers:
    if number >=100:
        print("- 100 이상의 수 : ",number)
        
print()

for number in numbers:
    if number%2==0:
        print(f"{number}는 짝수입니다")
    else:
        print(f"{number}는 홀수입니다")
        
print()

for number in numbers:
    cnt=0
    i=1
    while number//i!=0:
        cnt = cnt + 1
        i = i* 10
        
    print(f"{number}는 {cnt} 자릿수입니다")
