# File: TSQL Homework 2c
# Name: William Chan
# Date: 14 July, 2020

1. List the date/time types in T-SQL.
	* DATETIME 
	* SMALLDATETIME
	* DATE
	* TIME
	* DATETIME2
	* DATETIMEOFFSET
1. How do you express a date/time literal in T-SQL?
	* use character strings to express date and time values. WHERE orderdate = '20160212';
	* explicitly converts the character string to a DATE data type: WHERE orderdate = CAST('20160212' AS DATE);
1. What is the setting DATEFORMAT used for?
	* determines how SQL Server interprets the literals you enter when they are converted from a character-string type to a date and time type. 
1. Write a T-SQL snippet changing the date format to German. Read the documentation on how to do this.
	* DECLARE @thedate date = '2020-12-01'
	SELECT FORMAT(@thedate, 'd', 'de-de') Result;
1. What is the difference between CAST(), CONVERT(), and PARSE()?
	* The CAST function is ANSI standard and is compatible to use in other databases while the CONVERT function is a specific function of the SQL server.
	* CAST: 
		* CAST ( expression AS data_type [ ( length ) ] ) 
	* CONVERT: explicitly convert the character-string literal to the requested data type and, in the third argument, specify a number representing the style you used. 
		* SELECT CONVERT(DATE, '02/12/2016', 101);
	* PARSE:  By using this function, you can parse a value as a requested type and indicate the culture. 
		* SELECT PARSE('02/12/2016' AS DATE USING 'en-US');
1. What function returns the current date? This is very useful in a table that maintains a log of events, such as user logins.
	* CURRENT_TIMESTAMP
1. How do you add one day to the current date? Add one week? Add one month? Add one year?
	* SELECT DATEADD(year, 1, '20160212');
1. Write a SQL snippet to return the number of years between your birth date and today’s date.
	* SELECT DATEDIFF(year, '1986026', '20200714');
1. How do you check a string literal to see if it represents a valid date?
	* SELECT ISDATE('20160212'); returns 1/true
	* SELECT ISDATE('20160230'); returns 0/false
1. What does EOMONTH() do? Give an example of why this might be very useful.
	* The EOMONTH function accepts an input date and time value and returns the respective end-ofmonth date as a DATE typed value. 
	* you can query return orders placed on the last day of the month
		* SELECT orderid, orderdate, custid, empid
			FROM Sales.Orders
			WHERE orderdate = EOMONTH(orderdate);
1. Payments are due exactly 30 days from the date of the last function. Write a select query that calculates
the date of the next payment. Pretend we want to update a column in a database that contains the
date of the next payment. We will do this when we write UPDATE queries.
	* select dateadd(day, 30, getdate())
	
1. Suppose your son or daughter wants to run a query every day that tells them the number of days until
their 16th birthday. Write a select query that does this.
	* 


 