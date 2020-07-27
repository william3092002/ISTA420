# File: TSQL Homework 3
# Name: William Chan
# Date: 15 July, 2020

1. In general, why would you even want to join two (or more) tables together? This is a good time to
think about the nature of relational algebra.
	* support normalization. 
2. Describe in your own words the output from an inner join.
	* The inner join keyword selects records that have matching values in both tables.
		* SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
3. Describe in your own words the output from an outer join.
	* similar to inner join, it goes back and add rows from the LEFT* table 
4. Describe in your own words the output from an cross join.
 * it's a combination of every rows from two tables. 	
	* SELECT C.custid, E.empid
		FROM Sales.Customers AS C
		CROSS JOIN HR.Employees AS E;
5. A convenient mnemonic for remembering the various joins is “Ohio.” Why is this true?
	* One type of cross join
	* One type of inner join
	* three types of outer joins
		* LEFT
		* RIGHT
		* FULL

6. Give an example of a composite join.
	* A composite join is simply a join where you need to match multiple attributes from each side.
		* FROM dbo.Table1 AS T1
 INNER JOIN dbo.Table2 AS T2
 ON T1.col1 = T2.col1
 AND T1.col2 = T2.col2
	
7. What is the difference between the following two queries? The business problem is “How many orders
do we have from each customer?”
	* the first query will count all the orders while the second query only counts records that has a orderid in the orders table.
8. What might be one reason the following query does not return the column custID in this query?
	* it contains the value of null