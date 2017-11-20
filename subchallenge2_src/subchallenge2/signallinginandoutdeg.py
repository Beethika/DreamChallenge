from __future__ import division
import sys
import networkx as nx
from collections import OrderedDict
import operator
ff=open(sys.argv[2])
G=nx.DiGraph()
for i in ff:
    g=i.split("\t")
    G.add_edges_from([(g[0],g[1])],weight=float(g[2]))
indegrees=G.in_degree(weight='weight')
outdegrees=G.out_degree(weight='weight')
f=open(sys.argv[1])
for j in f:
    jj=j[:-1].split("\t")
    edgelist=G.edges(jj[2:],data=True)
    sumofedges=[]
    G1=nx.DiGraph()
    for i in jj[2:]:
        for j in jj[2:]:
            for edges in edgelist:
               if i<j:
                   if (str(i) == edges[0] and str(j) == edges[1]) or (str(j) == edges[0] and str(i) == edges[1]):
                       G1.add_edges_from([edges])
    if len(G1.nodes()) != 0:
        print jj[0]#,G1.in_degree(weight='weight'),G1.out_degree(weight='weight')
    #else:
        #print jj[0],0,
    #print '\n'

