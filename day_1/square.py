width = input("가로 : ")
height = input("세로 : ")
surface = int(width)*int(height)

print("면적은", surface, "입니다")

#주급 계산하기
#근무시간, 시간당급여액 입력

time = int(input("worktime = "))
salary = int(input("salary = "))

money = time * salary

print("주급은 ",money)
print("주급은 "+str(money))
#문자열과 숫자를 섞어서 출력
#지금은 안쓰는듯한 표현
#print(str.format("주급은 %d",%money))
print("주급은 {0}".format(money))
#fstring(문자열 앞에 f)
print(f"주급은 {money}")
