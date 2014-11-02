import pandas as p

data = p.read_csv('ag_2014.csv')

out = open('output_2014.txt', 'w')

group = []
for i in data.Group:
	group.append(i)

parent = []
for i in data.Parent:
	parent.append(i)

number = []
color = []

for i in data.Number:
	i = float(i)
	j = i / 100.0
	print j
	number.append(str(i))
	color.append(str(j))


for i,j,k,l in zip(group,parent,number,color):
	out.write("['" + i + "','" + j + "'," + k + ", " + l + "]," + '\n')

out.close()