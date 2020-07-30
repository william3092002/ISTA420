# File: TSQL Homework 07
# Name: William Chan
# Date: 29 July, 2020

1. What is a window function?
	* A window function is a function that, for each row, computes a scalar result value based on a calculation
against a subset of the rows from the underlying query. 
2. What does PARTITION do?
	* restricts the window to the subset of rows that have
the same values in the partitioning columns as in the current row.
3. What does ORDER BY do?
	* In a window aggregate function, window ordering supports a frame specification. 
4. What does ROWS BETWEEN do?
	* filters a frame,
or a subset, of rows from the window partition between the two specified delimiters. 
5. What is a ranking window function? Why would you use it? Give an example.
	* You use ranking window functions to rank each row with respect to others in the window. 
	
6. What is an offset window function? Why would you use it? Give an example.
	* You use offset window functions to return an element from a row that is at a certain offset from the
current row or at the beginning or end of a window frame. 
7. What do LEAD and LAG DO
	* You use these functions to obtain an element from a row that is at
a certain offset from the current row within the partition, based on the indicated ordering. The LAG
function looks before the current row, and the LEAD function looks ahead. 
8. What do FIRST VALUE and LAST VALUE do?
	* You use the FIRST_VALUE and LAST_VALUE functions to return an element from the first and last
rows in the window frame, respectively. 
9. What is an aggragate window function? Why would you use it? Give an example.
	* You use aggregate window functions to aggregate the rows in the defined window. 
10. What is a pivot table and what does it do?
	* Pivoting data involves rotating data from a state of rows to a state of columns, possibly aggregating
values along the way. 
11. In mathematical theory, what is a power set? How does this definition of power set relate to grouping
sets?
	* In mathematics, the power set of any set S is the set of all subsets of S, including the empty set and S itself
	* you are able to group by all subsets by using grouping set
12. What is a bit array? How can you implement a bit array to represent a set of flags? How does the
GROUPING ID() function implement a bit array?
	* A bit array is an array data structure that compactly stores bits. It's a collection of bit (ones and zeros)
13. Read the documentation on the UNIX/Linux chmod command. How would interpret this command:
chmod 755 myscript.sql?
	* read and execute access for everyone and also write access for the owner of the myscript.sql.