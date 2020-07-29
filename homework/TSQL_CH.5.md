

Paper View
# File: TSQL Homework 5
# Name: William Chan
# Date: 22 July, 2020

1. What is a table expression? Can you give a technical definition of a table expression?
	* it's an expression that evlautes to a table value (multiple coulmns)
	* it is a named query expression that represents a valid relational table. 
2. In what SQL clause are derived tables (table valued subqueries) located?
	* FROM clause
3. Why can you refer to column aliases in an outer query that you defined in an inner table valued
subquery?
	* The outer query can refer to the orderyear column alias in both the GROUP BY and SELECT clauses, because as far as the outer query is concerned, it queries a table called D with columns called orderyear and custid.
4. What SQL key word defines a common table expression?
	* WITH
5. When using common table expressions, can a subsequent derived table use a table alias declared in a preceding table expression?
	* becaus the FROM clause is executed first.
6. Can a main query refer to a previously defined common table expression by multiple aliases?
	* yes it can. 
7. In SQL, is a view a durable object?
	* yes, they are reusable. Views and inline table-valued functions (inline TVFs)two types of table expressions whose definitions are stored as permanent objects in the database. 
8. In a view, what does WITH CHECK OPTION do? Why is this important?
	* prevents modification that contracdicts your set condition
9. In a view, what does SCHEMABINDING do? Why is this important?
	* it binds the schema of referenced objects and columns to the schema of the referencing object.
	* if you use SCHEMABINDING, you cannot alter the table that make the view inoperable 
	* It indicates that referenced objects cannot be dropped and that referenced columns cannot be dropped or altered.
10. What is a table valued function?
	* A table-valued function is a user-defined function that returns data of a table type. The return type of a table-valued function is a table, therefore, you can use the table-valued function just like you would use a table.
11. What does the APPLY operator do?
	* to join a table to a table-valued function so the function is evoked for each row returned from the table. 
12. What are the two forms of the APPLY operator? Give an example of each.
	* cross apply and outer apply