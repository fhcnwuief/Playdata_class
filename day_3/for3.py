#list에 데이터를 담아두고 리스트에 있는 데이터의 합과 평균을 구하기

nums = [1,2,7,11,23,4,5,8,9,12]

#배열에 있는 데이터들의 합을 구하기

sum = 0 
#sum = sum + nums[i]

for i in nums:
    sum=sum+i
print("합계 = ",sum)

sum=0
for i in range(0,len(nums)):
    sum=sum+nums[i]
print("합계 = ",sum)