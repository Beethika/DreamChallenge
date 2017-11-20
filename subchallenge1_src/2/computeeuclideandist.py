import numpy
import sys
def dist(x,y):   
    return numpy.sqrt(numpy.sum((x-y)**2))

filenew=open(sys.argv[1])
deepwalkembeddings={}
for i in filenew:
    g=i[:-1].split(" ")
    deepwalkembeddings[g[0]]=numpy.array(g[1:],dtype=numpy.float64)
for i in deepwalkembeddings.keys():
    for j in deepwalkembeddings.keys():
        print i,j,dist(deepwalkembeddings[i],deepwalkembeddings[j])
    
