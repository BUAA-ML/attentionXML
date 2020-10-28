import numpy as np
from util import *

meter = AveragePrecisionMeter()

res = np.load('atxml/AAPD/AttentionXML-aapd-EUR-Lex-labels.npy')
targets = np.load('atxml/AAPD/test_labels.npy') 

labels = np.load('atxml/AAPD/labels_binarizer')


output = []
for r in res:
	temp = []
	print(len(r))
	for i in labels:
		if i in r:
			temp.append(1)
		else:
			temp.append(0)
	total = sum(temp)
	for j in range(len(temp)):
		if temp[j] == 1:
			 temp[j] = 1/total
	output.append(temp)

newtarget = []

for t in targets:
	temp = []
	for i in labels:
		if i in t:
			temp.append(1)
		else:
			temp.append(0)
	newtarget.append(temp)

output = np.array(output)
newtarget = np.array(newtarget)

meter.add(output,newtarget)

print(meter.overall())
print(meter.value().mean())