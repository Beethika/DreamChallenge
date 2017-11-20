import itertools

def mkunion(*args):
    return frozenset(itertools.chain.from_iterable(args))


f=open("confidence0.7.txt")
conf7=[]
for i in f:
    conf7.append(i[:-1])

confidence7=set(conf7)


f=open("0.8final.txt")
conf8=[]
for i in f:
    conf8.append(i[:-1])

confidence8=set(conf8)

f=open("0.9final.txt")
conf9=[]
for i in f:
    conf9.append(i[:-1])

confidence9=set(conf9)


f=open("1final.txt")
conf1=[]
for i in f:
    conf1.append(i[:-1])

confidence1=set(conf1)

confid9=mkunion(confidence8,confidence9,confidence1)
confidnew=confidence7 - confid9
for i in confidnew:
    print i

