
file_name = "D:\\friends.txt"
# txt_file = open(file_name)
count = 0
# D:\\com-friendster.ungraph.txt
f_number=1
file_w = open('file'+str(f_number)+'.txt', 'w')
with open('D:\\com-friendster.ungraph.txt','r',buffering=100000) as f:
    for line in f:
        count = count+1
        file_w.write(line)
        print(count)
        if count >= 1000000:
            file_w.close()
            count = 0
            f_number+=1
            file_w = open('file' + str(f_number) + '.txt', 'w')
# count = 10
# for line in txt_file:
#    count += 1
file_w.close()
f.close()
