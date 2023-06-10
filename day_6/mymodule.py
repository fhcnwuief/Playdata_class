def add(x, y):
    return x+y 

def sigma(limit=10):
    s = 0 
    for i in range(1, limit+1):
        s +=i 
    return s 

class MyCalc:
    def __init__(self, x=0, y=0):
        self.x = x 
        self.y = y 
    def add(self):
        return self.x + self.y    
    def sub(self):
        return self.x - self.y    

#__name__ : 모듈의 이름을 담고 있는 내장 변수
#python.py라는 파일이 있으면 __name__은 .py 확장자를 제외한 python

#__main__ : 최상위 코드가 실행되는 환경의 이름
#최상위 코드 : 프로그램 실행 시 첫번째로 실행되는 python모듈
#            프로그램 구동에 필요한 다른 모듈들을 import함

#모듈은 __name__을 확인하여 최상위 환경에서 실행 중인지의 여부 확인
#모듈이 최상위 코드 환경에서 실행되면 해당 __name__은 '__main__' 문자열로 설정됨
#python모듈 또는 패키지를 import하면 __name__은 모듈 이름으로 설정

#if __name__=="__main__" -> 이 코드는 의도치 않게 import module이 실행되는 것을 막기 위한 것
#                       즉, 메인 프로그램에서 실행했을 경우에만 수행하도록 제어하는 기능


if __name__ == "__main__":
    print( __name__ ) #시스템이 제공하는 내부변수  __main__
    print( add(4,5) )
    print( sigma() )
    print( sigma(100))

    calc = MyCalc(7,8)
    print( calc.add() )
    print( calc.sub() )


