'''
홍길동 90 80 70
장길산 100 100 90
임꺽정 80 70 60

list 안에 dict 으로 넣어놓고 총점 평균 구해서  출력
'''

List=[
    {'name':'홍길동','kor':90,'eng':70,'mat':70},
    {'name':'장길산','kor':100,'eng':100,'mat':90},
    {'name':'임꺽정','kor':80,'eng':70,'mat':60},
]

# sum = 0

# for i in range(0,len(List)):
#     sum = sum + List[i]["score1"] + List[i]["score2"] + List[i]["score3"]
    
# print(f"총점 = {sum} 평균 = {sum/len(List)}")


for score in List:
    score['total']=score['kor'] + score['eng'] + score['mat']
    score['avg'] = score['total']/3
    
for s in List:
    print(f"{s['name']} {s['kor']} {s['eng']} {s['mat']} {s['total']} {s['avg']}")