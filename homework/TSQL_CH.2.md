# File: TSQL Homework 02
# Name: William Chan
# Date: 7 July, 2020

1. The clauses are logically processed in the order of 
	* FROM
	* WHERE
	* GROUP BY 
	* HAVING
	* SELECT
	* ORDER BY 
	
1. Queries the rows FROM the Sales.Orders table. You specify the names of the tables you want to query. 
1. Filters orders WHERE the customer ID is 71. You specifya predicate or logical expression to filter the rows returned by the FROM phase. Only rows for which the logical expression evaluates to TRUE are returend by the WHERE phase to the subsequent logical query processing phase. 
1. GROUP the orders by employee ID and order year. You use GROUP BY to arrange the rows returned by the previous logical query processing phase in groups.
1. Filters only groups (employee ID and order year) HAVING more than one order. Whereas the WHERE clause is a row filter, the HAVING clause is a group filter. Only groups for which the HAVING predicate evaluates to TRUE are returend by the HAVING phase to the next logical query processing phase. 
1. SELECT (returns) for each group the employee ID, order year, and number of orders. The SELECT clause is where you specify the attributes (colums) you want to return in the result table of the query. 
1. DISTINCT keyword allow you to handle only distinct occurrences of known values.
1. ORDER (sorts) the rows in the output by employee ID and order year. You use the ORDER BY clause to sort the rows in the output for presentation purposes. 
1. limit clause is used to set an upper limit on the number of tuples returned by SQL.
1. The TOP clause is used to limit the number or percentage of rows your query returns.
1. The OFFSET-FETCH filter is considered an extension to the ORDER BY clause. With the OFFSET clause you indicate how many rows to skip and with the FETCH clause you indicate how many rows to filer after the skipped rows.

