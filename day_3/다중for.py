'''
for i in range(0,6):
    for j in range(1,5):
        코드

'''

# for i in range(1,6):
#     print("i=",i," j=",end=' ')
#     for j in range(1,6):
#         print(j,end=' ')
#     print()
    
# for i in range(1,6):
#     for j in range(1,i+1):
#         print("*",end='')
#     print()
    
for i in range(1,6):
    for j in range(5-i):
        print(' ',end='')
    for j in range(1,i*2):
        print('*',end='')
    print()
    

line=5
for i in range(0,line):
    for j in range(0,line-i):
        print(' ',end='')
    for j in range(0,2*i-1):
        print('*',end='')
    print()
    
    
for i in range(0,line):
    for j in range(0,i):
        print(' ',end='')
    for j in range(0,(line-i)*2-1):
        print('*',end='')
    print()
    
#1부터 100까지 한줄에 10개씩 이중for
l=1
for i in range(1,11):
    for j in range(1,11):
        print(l,end=' ')
        l=l+1
    print()
    