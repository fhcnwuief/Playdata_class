#클래스 설계할때 - 한사람분의 데이터 처리 
class Pay:
    def __init__(self, name="홍길동", work_time=40, per_pay=10000):
        self.name = name 
        self.work_time = work_time 
        self.per_pay = per_pay 
        self.calculate()
    
    def calculate(self):
        self.pay = self.work_time * self.per_pay #중간에 변수 추가를 해되 된다
        
    def output(self):
        print(f"{self.name} {self.work_time} {self.per_pay} {self.pay}")
        

p1 = Pay() 
p2 = Pay("임꺽정", 30, 30000)
p3 = Pay("장길산")
p4 = Pay("감감찬", per_pay=40000)

p1.output()
p2.output()
p3.output()
p4.output()

payList = [ Pay("A"), Pay("B"), Pay("C"), Pay("D"),Pay("E")]

for pay in payList:  #pay가 Pay객체이다 
    pay.output()
    


 

