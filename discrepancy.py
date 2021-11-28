#!/usr/bin/python
import pandas as pd 
import numpy as np
import itertools as itt
import time 
import os 

# pre-processing
data = pd.read_csv('input.csv')
target = 210.04
data['minus'] = -data['minus']

arr = np.r_[np.array(data['plus']),np.array(data['minus'])]
arr = arr[arr!=0]
arr = np.unique(arr)

# finding combos 
def combine_any(num):

	# lazy eval, itertools object is a map of tuples
	comb = itt.combinations(arr, num)

	# create a pandas DataFrame
	df = pd.DataFrame(list(comb))
	df['sum'] = round(df.sum(axis = 1), 2)

	# target_exists = target in df['sum'] 
	# precision error comparing float and np.float64
	
	# create difference column
	df['diff'] = df['sum'] - target 

	# establish tolerance level, use bool to subset 
	tolerance = np.finfo(np.float64).eps
	is_basically_zero = abs(df['diff']) < tolerance
	x = df[is_basically_zero]

	# get path and filename
	path = os.getcwd()
	filename = 'combination'+str(num)+'.csv'
	
	# write out csv 
	x.to_csv(os.path.join(path, filename))


start = time.time()
for i in range(2, 6):
	combine_any(i)
end = time.time()

print(end - start)

# In Python:
# 25.197231769561768 secs



