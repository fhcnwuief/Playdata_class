'''
while문은 몇번반복할지 알 수 없는 경우에 사용
한 번도 수행안될 가능성이 있음
'''
#무한루프 도는 코드
# i=1
# while i<=10:
#     print(i)

i=1
while i<=10:
    print(i)
    i=i+1 #무한루프 탈출
    
#1부터 10까지 한줄 출력
i=1
while i<=10:
    print(i,end=' ')
    i=i+1
print()

#1부터 n까지 더해간다. 합산이 최초로 1000을 넘는 n을 찾는다
i=0
sum=0
while sum<1000:
    i=i+1
    sum=sum+i
    
print(i)