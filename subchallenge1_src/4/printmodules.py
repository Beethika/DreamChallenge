a=[]
f=open("newlist.txt")
for i in f:
    a.append(i[:-1])
l=list(set(a))
m={}
for i in range(len(l)):
    m[l[i]]=i
for i in range(len(a)):
    print i,m[a[i]]
