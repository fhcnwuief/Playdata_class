#지역변수와 전역변수

#지역변수 : 함수내에서만 존재
#전역변수 : 함수외부에서 존재한다 - 모든 함수가 하나의 변수를 사용하고자 할때 사용

#전역변수
g_x = 1

def my_func():
    x=1      #지역변수
    global g_x  #전역변수임을 지정해야 알아듣는다
    
    g_x = g_x + 1
    print("지역변수",x)
    print("전역변수",g_x)
    print()
    
my_func()
my_func()
my_func()
my_func()
my_func()
my_func()


#반환값문제 - 반환이 값이 하나만 된다
def doubleValue(x,y):
    #함수 내의 매개변수는 함수외부로부터 값을 읽어만 오고 보내지 못함
    x=x*2
    y=y*2
    print("x=",x)
    print("y=",y)
    #함수가 종료되면 메모리가 사라짐
    print()
    
    return x,y 
    # 자동으로 튜플로 바뀌면서 하나가 리턴
    
    
a=5
b=7
result = doubleValue(a,b)
print(result,type(result))

#다른 언어의 경우에는 a라는 변수의 주소와 b라는 변수의 주소를 전달할 방법이 있으나, 파이썬은 존재하지 않음


a=5
b=7
#값 전달은 튜플로 진행
a,b = doubleValue(a,b)
print("a =",a)
print("b =",b)


