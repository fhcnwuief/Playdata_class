#파이썬의 함수는 def 키워드로 시작하고 함수이름(변수들)

#함수 정의
def display():
    print("--------------------------------------")
    
display()
display()
display()
display()
display()

#자바의 overloading - 함수의 이름이 같은데 매개변수의 형태나 숫자를 바꾸는 기술
#동일한 이름의 함수 못만듬

def display2(line):
    for i in range(0,line):
        print('******************************')
        
display2(3)
display2(5)

def display3(mark,line,cnt):
    for i in range(0,line):
        for j in range(0,cnt):
            print(mark)
        print()

display3('^',3,5)
display3('$',4,10)

#함수가 일을 처리하고 값을 반환하는 경우
def add(x,y):
    return x+y
#return - 함수를 종료하는 기능, 값을 반환하는 기능(값은 하나만 반환)

#함수 호출 시 매개변수에 값을 전달해야 함
#매개변수 - 함수 외부와 함수 내부를 연결하는 역할, 외부에서 값 전달목적으로 사용하는 변수
#def add(x,y):이때 x와 y가 매개변수
#매개체가 되는 변수(파라미터, 아규먼트) 라고 부름

print(add(4,5))
#return 값이 없으면 함수 실행 후 None이 반환됨
print(display())


#1~n까지의 합계를 구해서 반환하는 함수 만들기

def sigma(limit):
    result = 0
    for i in range(1,limit+1):
        result += i
        #result = result + i 와 같은 표현
    return result

print(sigma(10))
print(sigma(100))

