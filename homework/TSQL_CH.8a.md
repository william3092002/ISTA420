# File: TSQL Homework 08a
# Name: William Chan
# Date: 4 August, 2020

1. When using INSERT, is the list of columns necessary? Why or why not?
	* Specifying the target column names right after the table name is optional, but by doing so, you
control the value-column associations instead of relying on the order of the columns in the CREATE
TABLE statement. In T-SQL, specifying the INTO clause is optional.
2. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do
you not use a subquery?
	* you can use a subquery, you have to use a subquery for INSERT SELECT?
3. What is the operand for the INSERT EXEC statement?
	* The operand is a procedure.
	* You use the INSERT EXEC statement to insert a result set returned from a stored procedure or a
dynamic SQL batch into a target table. 
4. How would you use the INSERT INTO statement?
	* In terms of
syntax, simply add INTO <target_table_name> right before the FROM clause of the SELECT query you
want to use to produce the result set.
5. What are the parameters to the BULK INSERT statement?
	*  You can specify many options,
including the data file type (for example, char or native), the field terminator, the row terminator, and
others—all of which are fully documented. 
6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?
	* no, define a primary key or a unique constraint on that column.
7. How do you create a SEQUENCE object?
	* use the CREATE SEQUENCE command
8. How do you use a SEQUENCE object?
	* With sequences, you can
store the result of the function in a variable and use it later in the code
9. How do you alter a SEQUENCE object?
	* use update statement
10. What is the difference between DELETE and TRUNCATE?
	* The standard TRUNCATE statement deletes all rows from a table. Unlike the DELETE statement,
TRUNCATE has no filter.
	* delete operates row by row, turncate operates by table.
11. What is the difference between DELETE and DROP TABLE?
	* DELETE is a Data Manipulation Language command, DML command and is used to remove tuples/records from a relation/table. Whereas DROP is a Data Definition Language, DDL command and is used to remove named elements of schema like relations/table, constraints or entire schema.
