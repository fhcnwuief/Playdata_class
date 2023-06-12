#배열 - 파이썬의 리스트와 다름
#       인덱싱을 사용한다는 차원에서는 같으나 원래 배열은 프로그램 시작전에 메모리가 확정됨
#       데이터 추가나 삭제 못함
#       데이터를 추가하거나 삭제가 가능하도록 list 라는 타입을 따로 만듬
#       파이썬은 배열이 없음
#       2차원 또는 3차원 배열을 구현하기 위해서 리스트안에 리스트를 둠

#list 안에 list     => 데이터의 양이 많아지면(머신러닝) numpy의 ndarry타입으로 변환됨
#ndarray 타입은 c언어의 구조
matrix = [[1,2,3],[4,5,6],[7,8,9]]

print(matrix)
print(matrix[0]) #1행
print(matrix[1]) #2행


print(matrix[0][0]) #1행 1열
print(matrix[0][1]) #1행 2열
print(matrix[1][0]) #2행 1열

for i in range(0,3):
    for j in range(0,3):
        print(matrix[i][j],end = ' ')
    print()