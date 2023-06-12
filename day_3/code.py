# ord("문자")-> 해당 문자에 대한 유니코드 반환
print(ord("A"))
print(ord("B"))
print(ord("C"))
print(ord("D"))
print(ord("a"))
print(ord("b"))
print(ord("c"))
print(ord("d"))
print(ord("1"))
print(ord("2"))
print(ord("3"))

#ord의 반대역할 - chr(숫자) ->문자
print(chr(65))
print(chr(66))
print(chr(67))

f=65
for i in range(0,26):
    print(chr(f+i),end='')
print()




for i in range(0,26):
    k=i
    for j in range(0,26):
        print(chr(k+65),end=' ')
        k=k+1
        if k<25:
            k=0
    print()
        