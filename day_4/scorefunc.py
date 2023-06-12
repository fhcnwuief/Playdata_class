# 데이터명 : 이름, 국어, 영어, 수학 입력 -> 총점, 평균
# 평균 90 80 70 60 ->이름

scoreList=[]
def init():
    scoreList.append({"name":"dlalwn","kor":90,"eng":70,"math":"50"})
    
# 입력
def append():
    data = dict()
    data["name"]= input("이름 ")
    data["kor"]=int(input("국어 성적 "))
    data["eng"]=int(input("영어 성적 "))
    data["math"]=int(input("수학 성적 "))
    scoreList.append(data)

#계산 함수 호출
def func_call():
    cal()
    cal1()
    select()
    pr_cal()
    
    
#총점 계산
def cal():
    for item in scoreList:
        item['sum']=item["kor"]+item["eng"]+item["math"]

#평균 계산
def cal1():
    for item in scoreList:
        item['avg']=item['sum']/3
        
#결과 출력
def pr_cal():
    for item in scoreList:
        print(f"이름 : {item['name']} 총점 : {item['sum']} 합계 : {item['avg']} 성적 : {item['text']}")
        
#성적 계산
def select():
    for item in scoreList:
        if item['avg'] >= 90:
            item['text']="수"
        elif item['avg'] >= 80:
            item['text']="우"
        elif item['avg'] >= 70:
            item['text']="미"
        elif item['avg'] >= 60:
            item['text']="양"
        else:
            item['text']="가"


def find(name):
    for i in range(0,len(scoreList)):
        if name==scoreList[i]['name']:
            return i
    return None

#검색
def search():
    name=input("찾을 이름 : ")
    pos = find(name)
    if pos == None:
        print(name+"을 찾지못했습니다")
        return
    else:
        item = scoreList[pos]
        print(f"이름 : {item['name']} 총점 : {item['sum']} 합계 : {item['avg']} 성적 : {item['text']}")
        

#수정
def modify():
    name=input("찾을 이름 : ")
    pos = find(name)
    if pos == None:
        print(name+"을 찾지못했습니다")
        return
    else:
        data = scoreList[pos]
        data = dict()
        data["name"]= input("이름 ")
        data["kor"]=int(input("국어 성적 "))
        data["eng"]=int(input("영어 성적 "))
        data["math"]=int(input("수학 성적 "))
        

#제거
def delte():
    name=input("찾을 이름 : ")
    pos = find(name)
    if pos == None:
        print(name+"을 찾지못했습니다")
        return
    else:
        del scoreList[pos]


def start():
    init()
    while 1:
        append()
        num = int(input("press 1 to continue = "))
        if num==1:
            pass
        func_call()
        while 1:
            alter = input("search[s],modify[m],delete[d] = ")
            if alter == "s":
                search()
            elif alter == "m":
                modify()
            elif alter == "d":
                delte()
            else:
                return
    return

start()
    

