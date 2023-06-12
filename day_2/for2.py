#1부터 10까지의 합계 구하기

sum=0
i=1

for i in range(1,11):
    sum=sum+i
print(sum)

# 1부터 100까지 홀수만 더하기
sum=0
for i in range(1,101,2):
    sum=sum+i
print(sum)

# 1부터 100까지 7의 배수 개수 세기
cnt=0
for i in range(1,101):
    if i%7==0:
        cnt=cnt+1
print(cnt)