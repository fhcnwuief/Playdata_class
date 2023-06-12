#리스트에 데이터를 추가, 수정, 삭제

names=["홍길동","을지문덕","강감찬"]

#추가하기
names.append("서희")
names.append("윤관")
print(names)

#수정
names[0]="광개토대왕"
names[1]="장수왕"
print(names)

#삭제
names.remove("서희") # 내용을 찾아서 해당 내용이 있으면 처음 등장한 데이터 삭제
names.remove("강감찬")
print(names)

#위치 삭제
del names[0]
print(names)