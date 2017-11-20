##This code will take all the modules predicted by Multiplex modularity 0.1 and checks the signalling and coexpression edges in each module.
##If the out-degree of one of the signalling node is greater than 3 and average sum of co-expression edges > 0.25
##Then it prints the ID of the module 

from __future__ import division
import sys
import networkx as nx
from collections import OrderedDict
from collections import Counter
import operator
##open signalling network and construct a directed graph 
ff=open(sys.argv[2])
G=nx.DiGraph()
for i in ff:
    g=i.split("\t")
    G.add_edges_from([(g[0],g[1])],weight=float(g[2]))
indegrees=G.in_degree(weight='weight')
outdegrees=G.out_degree(weight='weight')

##open co-expression network and construct an undirected graph
ff1=open(sys.argv[3])
G2=nx.Graph()
for i1 in ff1:
    g1=i1.split("\t")
    G2.add_edges_from([(g1[0],g1[1])],weight=float(g1[2]))
degrees=G2.degree(weight='weight')

##Get Modules from the output of Multiplex modularity 0.1
f=open(sys.argv[1])
for j in f:
    jj=j[:-1].split("\t")
    #print jj[2:]
    edgelist=G.edges(jj[2:],data=True)
    edgelist1=G2.edges(jj[2:],data=True)
    G1=nx.DiGraph()
    G3=nx.Graph()
    sumofedges=[]
    for i in jj[2:]:
        for j in jj[2:]:
            for edges in edgelist:
               if i<j:
                   if (str(i) == edges[0] and str(j) == edges[1]) or (str(j) == edges[0] and str(i) == edges[1]):
                       G1.add_edges_from([edges])
            #print G1.nodes()
            for edges in edgelist1:
               if i<j:
                   if (str(i) == edges[0] and str(j) == edges[1]) or (str(j) == edges[0] and str(i) == edges[1]):
                       sumofedges.append(edges[2]['weight'])
            #print sumofedges
    x=G1.out_degree(weight='weight')
    sorted_x = sorted(x.items(), key=operator.itemgetter(1))[::-1]
    #print sorted_x
    if len(sumofedges) != 0 and len(G1.nodes()) != 0 and sorted_x[0][1] > 2:
        if sum(sumofedges)/len(sumofedges) > 0.25:
            print jj[0]#,sum(sumofedges)/len(sumofedges),G1.in_degree(weight='weight'),G1.out_degree(weight='weight')
    #else:
    #    print jj[0],0,
    #print '\n',
