flowers =[]

flowers.append("작약")
flowers.append("국화")
flowers.append("목련")
flowers.append("목단")
flowers.append("장미")
flowers.append("해바라기")

print(flowers)
print()

print(flowers[0])
print(flowers[2])
print(flowers[4])
print()

print(flowers[0:5:2])
print()

flowers[-1] = "백일홍"
print(flowers)
print()

flowers.append("사루비아")
flowers.append("맨드라미")
print(flowers)
print()

flowers.remove("목련")
print(flowers)
print()

print(len(flowers))
print()

del flowers[-1]
print(flowers)



