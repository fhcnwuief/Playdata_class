'''name='홍길동'
work_time = 30
per_pay = 20000


name2='임꺽정'
work_time2 = 20
per_pay2 = 15000


pay = work_time * per_pay
pay2 = work_time2 * per_pay2



print(name,work_time,per_pay,pay)
print(name2,work_time2,per_pay2,pay2)'''

#리스트-배열, 하나의 메모리에 여러개의 데이터를 저장할 수 있다

nums = [1,2,3,4,5,6,7,8,9,10] #리스트 안에 10개의 데이터를 저장할 수 있다
#데이ㅣ터 공간을 10개 만들고 0번부터 번호를 부여
#0,1,2,3,4,5,6,7,8,9
print(nums)
print(nums[0]) #인덱싱

#nums의 배열 자체가 사라지고 새로 만들어짐
nums=[10,20,30] # 새로 메모리를 만들어서 10,20 30을 저장하는거라 위의 리스트는 사라짐


#반복처리
for n in nums:   #기본 형태 : for 변수명 in 리스트타입 : -- 데이터를 하나씩 차례대로 변수로 옮겨준다
    print(n)
    