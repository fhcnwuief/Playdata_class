import random 

gameList=[]

#컴퓨터승 1, 사람승 2 무승부 3
def gameStart():
    #1.컴퓨터가 값을 갖고 있다 
    computer = random.randint(1,3)
    print("컴퓨터 : ", computer)
    person = int(input("1.가위 2.바위 3.보"))
    winner = whoWin(computer, person)
    gameInfo={"computer":computer, "person":person, "winner":winner}
    output(gameInfo)
    gameList.append(gameInfo)
    
def output(gameInfo):
    temp1 = ["", "가위", "바위", "보"]
    temp2 = ["", "컴퓨터승", "사람승", "무승부"]
    c = gameInfo['computer']
    p = gameInfo['person']
    w = gameInfo['winner']
    print(f"컴퓨터 : {temp1[c]} 사람:{temp1[p]} 승부:{temp2[w]}") 
        
def whoWin(computer, person):
    if computer== person:
        return 3
    
    if computer == 1:
        if person==2:
            return 2 #사람승
        else:
            return 1 
    
    if computer == 2:
        if person==1:
            return 1 #
        else:
            return 2       
    
    if computer == 3:
        if person==1:
            return 2 #
        else:
            return 1  
    

gameStart()