#dict 타입은 키와 값 쌍으로 데이터를 저장하는 타입
#키와 값 자체는 어떤 타입이든 상관없음
#보통 키의 경우 문자열을 많이 사용

colors = {'red':'빨간색','blue':'파란색','green':'초록색','black':'검정'}
#red,blue,green,black을 키라고 하고 키를 통해 접근
#인덱싱 슬라이싱 적용 안됨
print(colors['red'])
print(colors['blue'])
print(colors['green'])
print(colors['black'])

#키값이 이미 존재했으면 수정->값 바꿔치기, 없었으면 추가
colors['pink']="분홍색" #추가
colors['black']="까만색" #수정
print(colors)
#인덱싱 슬라이싱은 사용 안됨
#삭제
del colors['red']
print(colors)


# 순서는 입력된 순서대로 나오지 않음
for key in colors:
    print(key, colors[key])