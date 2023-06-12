#키와 값 쌍으로 정보를 저장

mydic = {"red":"빨간색","green":"초록색"}
#추가 또는 수정
#키 값이 없으면 추가, 키 값이 있으면 수정으로 판단
mydic["blue"]="파란색"

#keys() 함수는 키값들만 반환
if "red" in mydic.keys():
    print('red가 있다')
    print(mydic.keys())
    print(mydic.values())
else:
    print('red가 없다')
    
print(mydic['red'])
print(mydic['green'])
print(mydic['blue'])
# #키값이 없으면 예외를 발생
# print(mydic['yellow'])


#삭제
del mydic['red']
print(mydic.keys())