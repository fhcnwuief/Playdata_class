# 3의 배수 10개만 한줄로
for i in range (1,11):
    print(3*i,end=' ')
print()
print()    
# 100부터 10 작아지게 10까지 한줄로
for i in range(100,0,-10):
    print(i,end=' ')
print()    
print()    
# 선언된 리스트에서 홀수번만
colors = ['red','green','blue','cyan','magenta','black','brown','yellow','green']
for i in range(0,len(colors),2):
    print(colors[i],end=' ')
print()
print()    
# 구구단 4단
for i in range(1,10):
    print(f"4 * {i} = {4*i}")
print()
#1부터 100까지 출력, 10개마다 줄바꿈
for i in range(1,101):
    print(i,end=' ')
    if i%10==0:
        print()
        