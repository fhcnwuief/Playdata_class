import random
#외부 라이브러리를 불러옴
#자바의 import는 라이브러리 이름이 길어서 이름을 생략
#파이썬의 import는 라이브러리를 메모리로 불러와서 결합

print(random.randint(1,3))

num = []
play = []
for i in range(0,10):
    num.append(random.randint(1,3))
    play.append(int(input("1.가위 2.바위 3.보 : ")))

#result[p_w,p_l,dw]
result = [0,0,0]
# 가위>보 보>바위 바위>가위
# 1>3   3>2  2>1
for i in range(0,len(play)):
    if num[i]==play[i]:
        result[2]+=1
    else:
        if num[i]==1:
            if play[i]==3:
                result[1] +=1
            else:
                result[0] +=1
    
        elif num[i] == 2:
            if play[i] == 1:
                result[1] += 1
            else:
                result[0] += 1
                
        else:
            if play[i] ==2:
                result[1] +=1
            else:
                result[0] +=1
print(num)
print(play)
print(f"당신은 10게임을 했고 컴퓨터 {result[0]}승, 플레이어 {result[1]}승 무승부는 {result[2]}번")
            
     