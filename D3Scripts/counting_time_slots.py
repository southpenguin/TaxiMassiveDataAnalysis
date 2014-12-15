#!/usr/bin/env python
import sys
sys.path.append('.')
import csv

def parseInput():
    for line in sys.stdin:
        line = line.strip('\n')
        values = line.split(',')
        yield values




TIME = [0,0,0,0,0,0,0,0]
with open('testing2.csv', newline='') as csvfile:
	reader = csv.reader(csvfile)
	for row in reader:
		for values in row:
			values = int(values)
		if values>=0 and values<300:
			TIME[0] = TIME[0] + 1
		elif values>=300 and values <600:
			TIME[1] = TIME[1] + 1
		elif values>=600 and values <900:
			TIME[2] = TIME[2] + 1
		elif values>=900 and values <1200:
			TIME[3] = TIME[3] + 1
		elif values>=1200 and values <1500:
			TIME[4] = TIME[4] + 1
		elif values>=1500 and values <1800:
			TIME[5] = TIME[5] + 1
		elif values>=1800 and values <2100:
			TIME[6] = TIME[6] + 1
		else:
			TIME[7] = TIME[7] + 1

print (TIME)



		
