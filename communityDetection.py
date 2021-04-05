import snap as snap
import numpy as np
count = 0
file_number=8
#r = 65608366
r = 65608366
c = 3
node_list = np.zeros((r , c), dtype=np.int64)
print(node_list.shape)
#  "file"+"i"+".txt"
for i in range(file_number):
    f_i=i+1
    G = snap.LoadEdgeList(snap.PUNGraph, "file"+str(f_i)+".txt", 0, 1)
# snap.PrintInfo(G, "QA Stats", "qa-info.txt", False)
    CmtyV = snap.TCnComV()
    modularity = snap.CommunityCNM(G, CmtyV)
    # myfile = open('community'+'i'+'.txt', 'w')
    for Cmty in CmtyV:
        count += 1
        print("Community: ")
        # myfile.write("Community" + " "+ str(count)+"\n")
        for NI in Cmty:
            print(NI)
            if node_list[NI][2]==0:
                node_list[NI][2]=1
                node_list[NI][1]=count
                node_list[NI][0]=NI
           # myfile.write(str(NI))
            # myfile.write("\n")
mat = np.matrix(node_list)
with open('outfile.txt','wb') as f:
    for line in mat:
        np.savetxt(f, line,  fmt='%i')
# myfile.close()
# with open('D:\\com-friendster.ungraph.txt','r',buffering=100000) as f:
 #   for line in f:
  #      count = count+1
   #     print(count)
# count = 10
# for line in txt_file:
#    count += 1
#f.close()
f.close()
print(count+"sifat")
