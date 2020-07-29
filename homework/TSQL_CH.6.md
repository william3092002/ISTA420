
# File: TSQL Homework 6
# Name: William Chan
# Date: 28 July, 2020

1. What does a set operator do?
	* Set operators are operators that combine rows from two query result sets (or multisets). 
2. What are the general requirements of a set operator
	* The two input queries must produce results with the same number of columns, and corresponding
columns must have compatible data types. 
	* the two queries
involved cannot have ORDER BY clauses
	* it uses a so-called distinct predicate. This predicate produces a TRUE when comparing
two NULLs. 
3. What is a Venn Diagram? This is not in the book.
	* a diagram representing mathematical or logical sets pictorially as circles or closed curves within an enclosing rectangle (the universal set), common elements of the sets being represented by the areas of overlap among the circles.
4. Draw a Venn Diagram of the UNION operator. What does it do?
	* unifies the results of the two queries and eliminates duplicates. 
5. Draw a Venn Diagram of the UNION ALL operator. What does it do?
	* The UNION ALL operator unifies the two input query results without attempting to remove duplicates
from the result.
6. Draw a Venn Diagram of the INTERSECT operator. What does it do?
	*  returns only distinct rows that appear in both input query
results.
7. If SQL Server supported the INTERSECT ALL operator, what would it do?
	* returns the number of duplicate rows matching the lower of the
counts in both input multisets. 
8. Draw a Venn Diagram of the EXCEPT operator. What does it do?
	* returns only distinct rows that appear in the first set but
not the second. 
9. If SQL Server supported the EXCEPT ALL operator, what would it do?
	* EXCEPT ALL returns only
occurrences of a row from the first multiset that do not have a corresponding occurrence in the second.
10. What is the precedence of the set operators?
	* The INTERSECT operator precedes UNION and EXCEPT,
and UNION and EXCEPT are evaluated in order of appearance. 
11. The symmetric difference of two sets A and B is all elements in A that are also not in A and B, and all
elements of B that are also not in A and B. For example, if set A consisted of all integers between 1 and
100 that are divisible by 2, and set B consisted of all integers between 1 and 100 that are divisible by
3, the symmetric difference of A and B would include all integers in A and B except integers divisible
by both 2 and 3, e.g., 6, 12, 18, etc. Write a SQL query that computes the symmetric difference of two
tables A and B.
