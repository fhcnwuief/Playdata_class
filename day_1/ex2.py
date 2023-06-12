money = int(input(""))
cnt=[0,0,0,0,0,0,0,0]
unit=[50000,10000,5000,1000,500,100,50,10]

for i in range(0,8):
    cnt[i]=money//unit[i]
    money=money%unit[i]
    print("{0}원 {1}개,".format(unit[i],cnt[i]),end=' ')
