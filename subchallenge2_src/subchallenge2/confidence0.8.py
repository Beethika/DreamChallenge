f=open("confidence0.8.txt")
conf8=[]
for i in f:
    conf8.append(i[:-1])

confidence8=set(conf8)

f=open("confidence0.9.txt")
conf9=[]
for i in f:
    conf9.append(i[:-1])

confidence9=set(conf9)


f=open("confidence1.txt")
conf1=[]
for i in f:
    conf1.append(i[:-1])

confidence1=set(conf1)

confid9=confidence9-confidence1
confidnew=confidence1 - confid9
#print len(confid9)

for i in (confidence8 - (confid9.union(confidnew))):
    print i
'''

f=open("confidence0.8.txt")
conf8=[]
for i in f:
    conf.append(i[:-1])

confidence8=set(conf8)


f=open("confidence0.8.txt")
conf8=[]
for i in f:
    conf.append(i[:-1])

confidence8=set(conf8)

'''
