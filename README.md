# R_vs_Python
A repo for performance tests between R and Python.

## Test 1: Finding Discrepancies

### Motivation:

A bookkeeper often encouters a type of problem and needs help automating a solution.
Given two final balances from two different sources, one a bank statement, and the
other her own calculations, she encouters a discrepancy that has to be explained
and resolved.

The bank statement final balance does not have details, so she must look at her
own calculations to figure out what possible combinations of 2, 3, 4 and 5 numbers
(she figured that 5 would be enough combinations to look at) could explain the
discrepancy she found.

Her calculations come from an accounting system which records credits and debits
to various accounts -- she pulls up the two columns of credits and debits into an
Excel spreadsheet and labels these columns "plus" and "minus", but leaves them both
as positive numbers, saving that as a CSV file called "input.csv" which will serve
as the data input to the programmer.

Create a program that ingests the "input.csv" file, calculates all possible unique 
combinations of of 2 to 5 numbers that would explain the discrepancy the bookkeeper 
found, and save these combinations as CSV files.

The discrepancy found in the final balances is of 210.04 dollars.

Figure out how long it takes for your program to run. For performance and practical
reasons, an ideal program should take less than a minute to spit out results.


### Solutions:

The R solution takes in general three times longer than the Python solution, yet 
the coding style is more imperative and the Python coding style more functional. 
The next step is to apply mapping functions in R to see if it improves performance.

Both solutions use brute-forcing approaches. From a purely performance-improvement
perspective, a more sophisticated approach could be pursued.

---





# BookkeepingDiscrepancies
