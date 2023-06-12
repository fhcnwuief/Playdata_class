#람다 : 이름이 없는 함수, 잠깐 만들어서 쓰고 버리는 일회용
#       함수 중에 계속적으로 존재 해야 하는 함수가 있고, 잠깐 쓰고 버리는 함수



#filter(함수,iterable 객체) : 함수, 변환값이 True, False -> 실행결과가 참이면 그 데이터만 보내주고 False이면 데이터 안줌
#                               특정 조건에 맞는 데이터 추출

nums = [1,2,33,3,4,6,23,26,17,19,21,8,19,27]
#짝수만 필터링

evenList=[]
for n in nums:
    if n%2==0:
        evenList.append(n)

print(evenList)
print()
def myFileter(compare,nums):
    evenList=[]
    for n in nums:
        if compare(n):
            evenList.append(n)
    return evenList

def myCompare(x):
    return x%2==1

print(myFileter(myCompare,nums))
print()
def add(x,y):
    return x+y

calc = add
#함수의 주소를 변수에 자정이 가능함
print(calc(4,5))
print(add(4,5))
print()
# 프로그램중에 일부만 살짝 고칠수 있다면 함수를 미리 만들어놓고 나머지는 사용자가 완성하게 함

print(list(filter(myCompare,nums)))
print()
#myCompare => 람다 형식
# lambda x : x%2 == 0    -> return문 사용 못함, 한줄만
wordList = ["school","book","bookstore","desk","hospital","survey","assembly","president",
            "python","flower","sky","cloud","language","phone","house"]

for item in filter(lambda w:len(w)>=5, wordList):
    print(item)

print()


for item in filter(lambda w:w[0]=='b',wordList):
    #for item in filter(lambda w: "b" iin w, wordList)
    print(item)

print(list(filter(lambda w: "b" in w, wordList)))


#map = 연산을 수행해서 값을 변형해서 반환
# x=>x'[연산이 가해진 변경된 x]
nums = [1,2,33,3,4,6,23,26,17,19,21,8,19,27]
#nums에 값을 10씩 더하기

print(list(map(lambda x:x+10,nums)))

#wordList의 문자들을 대문자로 변경
print(list(map(lambda x:x.upper(),wordList)))

#zip(list1, list2, list3) => 각 원소들끼리 결합해서 새로운 튜플로 만들어서 반환

nameList = ["홍길동","임꺽정","장길산"]
phoneList = ["010-0000-0001","010-0000-0002","010-0000-0003"]
emailList = ["1","2","3"]

for data in zip(nameList,phoneList,emailList):
    print(data,type(data))
    
    
#정렬 - 하나는 자기자신의 순서는 그대로, 바뀐순서만을 반환
#       자기자신의 순서를 바꾼다

#list 타입에 존재하는 함수가 sort - 자기 자신의 순서를 바꾼다
#오름차순 정렬
# nums.sort()
# print(nums) 
# #내림차순 정렬
# nums.reverse()
# print(nums)

# wordList.sort()
# print(wordList)

# wordList.reverse()
# print(wordList)

sortedList = sorted(nums)
print(nums)
print(sortedList)

sortedwordList = sorted(wordList)
print(wordList)
print(sortedwordList)

dataList = [
    {"name":"강감찬","age":23},
    {"name":"강감찬","age":20},
    {"name":"김연경","age":33},
    {"name":"조승연","age":28},
    {"name":"김연아","age":30},
    {"name":"이순신","age":43},
    {"name":"서휘","age":35},
    {"name":"윤관","age":27},
    {"name":"박세리","age":43},
]

#dataList -> 각 요소가 dict 타입, x=dict
dataList.sort(key=lambda x:x["name"])
print(dataList)
print()
#이름 역순 정렬
sortedDataList = sorted(dataList,key=lambda x:x["name"],reverse=True)
print(sortedDataList)
print()
#나이순으로 정렬
dataList.sort(key=lambda x:x["age"])
print(dataList)
print()
#나이순 역순 정렬
sortedDataList = sorted(dataList, key=lambda x:x["age"],reverse=True)
print(sortedDataList)
print()

