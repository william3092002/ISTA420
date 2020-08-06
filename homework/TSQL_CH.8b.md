# File: TSQL Homework 08b
# Name: William Chan
# Date: 5 August, 2020

1. The sales tax rate for a state just changed. How would you update the state sales tax table to reflect
the changes? Assume that this table has an ID column, an RATE column, and a STATE column.
	* update table_name
	  set stateTax = stateTax * 1.08
	  where state = Maryland
2. The Revenue Division has requested that you provide a report on what the actual sales taxes would
have been for all orders in the past year, assuming the retroactivity of the new sales tax rate. How
would you calculate this?
	* select orderid, convert(decimal(10,2),(unitprice * qty + unitprice * qty * rate))
as salesTax from table_name where orderdate like  '2019-%';
3. Explain how the proprietary assignment update command works.
	* DECLARE @nextval AS INT;
UPDATE dbo.MySequences
  SET @nextval = val += 1
WHERE id = 'SEQ1';
SELECT @nextval;
4. What is one very important purpose of the MERGE SQL statement? What is ETL (not in book)?
	* ETL stands for Extract, Transform and Load, which is a process used to collect data from various sources, transform the data depending on business rules/needs and load the data into a destination database.
	* You can do insert, update and delete in one query
5. What are the semantics of MERGE?
	* start off with MERGE INTO table AS TGT
	  USING table AS SRC
	    ON TGT.custid = SRC.custid
	  WHEN MATCHED THEN
		UPDATE
	  WHEN NOT MATCHED THEN
		INSERT
	  WHEN NOT MATCHED BY SOURCE THEN
	    DELETE
	* insert, update, delete
6. Write a typical INSERT OUTPUT statement.
	insert into dbo.presidents(id, lastname)
	output inserted.id, inserted.lastname
	values(3, Obama);
7. Write a typical UPDATE OUTPUT statement.
	* update dbo.presidents set id = '1'
	  output inserted.id
	  where id = 44;
8. Write a typical DELETE OUTPUT statement.
	* DELETE FROM dbo.presidents output deleted.id WHERE id = '40';
9. Write a typical MERGE OUTPUT statement.
	* MERGE into dbo.presidents as TGT
	  using dbo.uspresidents as SRC
	    on TGT.id = SRC.id
	  when matched then 
	    update set 
	      TGT.lastname = SRC.lastname
      when not matched the
		  insert (id)
	      value (SRC.id)
	  output id
10. What is nested DML?
	* when you have one of the DML nested inside of a DML. DML = adding(inserting), modifying(updating) and deleting. 
11. (Not in book) Write a query adding a new column to a table named PERSON. The new column name
is DayOfBirth and the data type is string. Use ANSI SQL syntax.
	* Alter table PERSON add DayOfBirth varchar(50); 
12. (Not in book) Write a query adding a DEFAULT constraint to the column DayOfBirth. The constraint
is that the value matches one of SUN, MON, TUE, WED, THU, FRI, or SAT.
	* ALTER table PERSON ALTER COLUMN DayOfBirth ADD constraint chkDay CHECK (DayOfBirth likw '[SUN],[MON],[TUE],[WED],[THU],[FRI],[SAT]); 
13. (Not in book) Write a query adding a foreign key to the column DayOfBirth. The referenced table is
named WEEK and the referenced column is ValidDay.
	* ALTER table PERSON ALTER COLUMN DayOfBirth ADD foreign key (DayOfBirth) not null reference WEEK(ValidDay); 