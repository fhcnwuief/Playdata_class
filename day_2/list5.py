#검색(search) - 데이터가 있는 곳의 위치를 찾는 것
#선형 검색, 이분검색, 해쉬검색

fruits=["사과","참외","오렌지","바나나","사과","딸기","사과","포도","배"]

# 단어 in 리스트 : 해당 리스트에 단어가 존재하면 True, 없으면 False를 반환
print("사과" in fruits)
print("망고" in fruits)
# 없으면 에러 발생, 혼자 사용 모함, in 연산자 혹은 count 함수와 같이 사용
print(fruits.index("사과"))
#print(fruits.index("망고"))

#count : 존재 개수를 카운트

print(fruits.count("사과"))
print(fruits.count("망고"))
print(fruits.count("딸기"))
print(fruits.count("포도"))

#조건식

if "망고" in fruits:
    print(fruits.index("망고"))
else:
    print("망고 없음")

if fruits.count("사과")>0:
    print("사과의 위치 : ",fruits.index("사과"))
else:
    print("사과 없음")