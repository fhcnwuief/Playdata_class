names = ["홍길동","임꺽정","장길산"]
work_times=[40,30,20]
per_pays=[20000,15000,30000]

pays=[]
for i in range(0,3):
    pays.append(work_times[i] * per_pays[i])
    
for i in range(0,3):
    print(names[i],"의 급여는",pays[i],"입니다")