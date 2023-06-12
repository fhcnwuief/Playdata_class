#1. 추가기능
#2. 수정기능
#3. 삭제기능
#4. 주급계산 및 출력

#함수를 잘 만드는 방법(클린코드)
#함수는 한가지의 기능에만 집중
#만약에 같이 진행되어야 하고 기능이 2가지면 함수를 하나 더 만든다
#기능1함수, 기능2함수, 합치는함수를 만들어 연결

#공유메모리, 모든 함수가 사용됨
payList = []

def init():
    payList.append({"name":'홍길동',"work_time":40,"per_pay":20000})
    payList.append({"name":'임꺽정',"work_time":30,"per_pay":20000})
    payList.append({"name":'장길산',"work_time":20,"per_pay":30000})


#데이터 추가만 담당하는 함수
def append():
    data = dict()
    data["name"] = input("이름 : ")
    data["work_time"] = int(input("일한 시간 : "))
    data["per_pay"] = int(input("시간당 단가 : "))
    payList.append(data)

def output():
    for item in payList:
        print(f"{item['name']} {item['work_time']} {item['per_pay']}")
        
def process():
    for item in payList:
        #item = dict타입이라 아무키나 추가 가능
        item['payment'] = item['work_time'] *item['per_pay']
    output_pay()
    
def output_pay():
    for item in payList:
        print(f"{item['name']} {item['work_time']} {item['per_pay']}") 
    
    
#위치를 찾는 함수 -> 검색해서 출력, 수정, 삭제시에도 사용
#선형검색 => 람다, 컴프리핸션
#맨 처음 데이터부터 찾는 데이터 나올때가지 차례대로 읽어본다
#데이터가 없으면 None

def find(name):
    for i in range(0,len(payList)):
        if name==payList[i]["name"]:
            #서로 일치하는 데이터가 있으면 위치를 반환하고 함수를 종료
            return i
    #for문을 끝나도록 못찾은 경우에는 없다는 의미
    #None을 반환
    #파이썬의 경우에는 함수에서 목적 달성 못할 경우 주로 None을 반환함
    
    return None
#검색
def search():
    name = input("찾을 이름 : ")
    pos=find(name)
    if pos==None:
        print(name+"을 찾지 못했습니다")
        #더이상 수행하지 않는다. 이미 오류가 발생했으므로 else를 쓰지 않음
        return 
    #if error1: return 구조로 기술하면 함수를 보다 깔끔하고 확장성있게 만들 수 있다
    #에러가 아닐 경우 처리
    item = payList[pos]
    #해당 위치 값을 가져와서 출력
    print(f"{item['name']} {item['work_time']} {item['per_pay']}") 
#수정
def modify():
    name = input("찾을 이름 : ")
    pos=find(name)
    if pos==None:
        print(name+"을 찾지 못했습니다")
        return 
    data = payList[pos]
    data["name"] = input("이름 : ")
    data["work_time"] = int(input("일한 시간 : "))
    data["per_pay"] = int(input("시간당 단가 : "))
#삭제   
def delete():
    name = input("찾을 이름 : ")
    pos=find(name)
    if pos==None:
        print(name+"을 찾지 못했습니다")
        return 
    del payList[pos]
    
def menu():
    print("0.종료")
    print("1.추가")
    print("2.출력")
    print("3.계산")
    print("4.검색")
    print("5.수정")
    print("6.삭제")

def start():
    init()
    while True:
        menu()
        sel = input("선택 : ")
        if sel =="1":
            append()
        elif sel=="2":
            output()
        elif sel=='3':
            process()
        elif sel=='4':
            search()
        elif sel=='5':
            modify()
        elif sel=='6':
            delete()
        else:
            #함수가 종료, while 문도 종료
            return 
        
start()