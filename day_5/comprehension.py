#파이썬의 list 타입에만 축약
nums = [1,2,33,3,4,6,23,26,17,19,21,8,19,27]
wordList = ["school","book","bookstore","desk","hospital","survey","assembly","president",
            "python","flower","sky","cloud","language","phone","house"]

#nums에 값을 10씩 더하기
#list 타입에서 데이터 추출하기 위한 용도
#[변수명  for  변수명  리스트타입]
#[변수명  for  변수명  리스트타입 if 조건식]  -> 조건식이 True 인것만 추출
#[함수(변수명)  for 변수명 리스트타입 if 조건식]  ->조건식이 True 인것 중에 값을 변경해서 추출

#소프트카피(얕은카피)와 하드카피(깊은카피)
#ㅍ파이썬의 모든 변수는 데이터 자체가 아닌 데이터의 주소 저장
#만일 nums라는 변수가 있을 때, nums2=nums 라고 하면 이때 nums2에는 nums에 저장된
#주소값이 복사되어 실제 데이터는 하나이고 두개의 변수가 같은 데이터를 소유하게 됨
#이를 얕은카피라 하고 모든 참조형 또는 포인터형 변수의 기본 특징

nums2 =nums
#이때 두 변수는 같은 데이터공간을 소유하게 됨
nums2[0]=100
print(nums2)
print(nums)


nums2 = [x for x in nums]
#하드카피상황
nums2[0]=100

print(nums)
print(nums2)

evenList = [n for n in nums if n%2==0]
print(evenList)

#3의 배수만 추출
List = [n for n in nums if n%3==0]
print(List)

#wordList에서 문자열 크기가 5글자 넘어가는것만 추출하기
List2 = [n.upper() for n in wordList if len(n) > 5]
print(List2)

#외부에서 라이브러리를 들고 들어온다. 새로운 이름을 부여
import numpy as np
x = [1,2,3,4,5]     #list 타입
x = np.array(x)     #ndarry 타입으로 전환
y = 2*x + 1         #백터연산, R언어
print(y)