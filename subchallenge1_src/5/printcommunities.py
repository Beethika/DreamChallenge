import sys
f=open(sys.argv[1])
i=0
for j in f:
    jj=j[:-1].split("\t")
    print i+1,"\t",
    for jjk in jj[1:]:
        print jjk,"\t",
    print "\n",
    i=i+1 
