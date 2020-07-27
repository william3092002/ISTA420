# File: TSQL Homework 4
# Name: William Chan
# Date: 21 July, 2020

1. In your own words, what is a subquery?
	* a subquery is a query within another query and embedded within the WHERE clause; aggregate function in the SELECT clause.  
2. In your own words, what is a self contained subquery?
	* a self query is a stand alone queries, without any dependencies.
3. In your own words, what is a correlated subquery?	
	* a correlated subquery reference one or more columns from the outer query and therefore depend on the outer query.
4. Give an example of a subquery that returns a single value. When would you use this kind of subquery?
	* SELECT MAX(orderid) from hr.Employees;
	* when you want a single value to be returend. It can be used in the SELECT clause. 
5. Give an example of a subquery that returns multiple values. When would you use this kind of subquery?
	* SELECT empid from hr.Employees;
	* when you want multiple return values to be returned from your query. It returns one column.
6. Give an example of a subquery that returns table values. When would you use this kind of subquery?
	* SELECT * from hr.Employees; 
	* it returns multiple lists (colums)
7. What does the exists predicate do? Give an example.
	* it accepts a subquery as input and returns true if the subquery returns any rows and false otherwise.
	* SELECT custid, companyname
FROM Sales.Customers AS C
WHERE country = N'Spain' 
AND EXISTS
 (SELECT * FROM Sales.Orders AS O
 WHERE O.custid = C.custid);
8. What happens if we use the not operator before a predicate? Give an example.
	* it will return false if subquery returns any rows and otherwise false. 
	* SELECT custid, companyname
		FROM Sales.Customers AS C
WHERE country = N'Spain'
 AND NOT EXISTS
 (SELECT * FROM Sales.Orders AS O
 WHERE O.custid = C.custid);
9. When you use exists or not exists with respect to a row in a database, does it return two or three
values? Explain your answer.
	* Two values, it's either true or false.
10. How would you use a subquery to calculate aggregates? For example, you want to calculate yearly
sales of a product, and you also want to keep a running sum of total sales. Explain how you would use
a subquery to do this.
	*

