
# PRE-PROCESSING

# read csv file 
rm(list=ls())
dfm <- read.csv('input.csv')

# get target value from user 
#target <- readline(prompt='Enter discrepancy amount: ')
target <- '210.04'

# change second column to negative
dfm$minus <- -dfm$minus

# combine both columns into a single vector
vec <- c(dfm$plus,dfm$minus)

# remove all zeroes and duplicates 
vec <- as.numeric(lapply(vec,function(x) x[x!=0]))
vec <- vec[!is.na(vec)]
vec <- sort(unique(vec))


# FIGURING OUT COMBINATIONS

combineAny <- function(num) {

	# get dataframe of combos
	comb <- as.data.frame(t(combn(vec, num)))
	
	# create Sum column 
	if (num == 2) {
		comb$Sum <- comb$V1+comb$V2
	} else if (num == 3) {
		comb$Sum <- comb$V1+comb$V2+comb$V3
	} else if (num == 4) {
		comb$Sum <- comb$V1+comb$V2+comb$V3+comb$V4
	} else {
		comb$Sum <- comb$V1+comb$V2+comb$V3+comb$V4+comb$V5
	}

 	# find whether target Sum exists  
	target_exists <- ifelse(target %in% comb$Sum, 1, 0)


	if (target_exists == 1) {

		# get dataframe of unique combos
		x <- unique(comb[comb$Sum == target,])
		x <- x[,-which(colnames(x) == 'Sum')]
		
		# sort columns and remove duplicate rows 
		for (i in 1:nrow(x)) {
			x[i,] <- sort(x[i,])
		}
		x <- unique(x)
		
		# write out csv with results 
		write.csv(x, paste('combo',num,'.csv',sep=''))
	}
}



system.time({ 

	# run combineAny() for combos of 2-to-5 figures
	for (i in 2:5) {
		combineAny(i)
	}
})

#   user  system elapsed 
#  73.66    0.90   75.30 
	


	
	
	
	
	
	
	
	
	
	
	




