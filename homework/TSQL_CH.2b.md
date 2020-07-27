# File: TSQL Homework 2b
# Name: William Chan
# Date: 8 July, 2020

1. A data type is an attribute that specifies the type of data that the object can hold. We have data type for the purpose of supporting different use cases.
1. Collation is a property of character data that encapsulates sevral aspects: language support, sort order, case sensitivity and accent sensitivity.
1. substring('    Dave    ', 5, 4); select rtrim(ltrim('    Dave    '));
1. select * from college where name like "%instit%"; 
1. select charindex(' ','Barack Hussein Obama');
1. select substr(c.contactname, 1, instr(c.contactname, " ")) from customers c;
1. NOT > AND > BETWEEN, IN, LIKE, ORdata
1. Parentheses > * , / , % > + , -
1. You use the simple form to compare one value or scalar expression with a list of possible values and return a value for the first match. The searched CASE form is more flexible in
the sense you can specify predicates in the WHEN clauses rather than being restricted to using equality comparisons.
1. select substr(c.contactname, instr(c.contactname, " ")+1) || ", " || substr(c.contactname, 1, instr(c.contactname, " ")) from customers c limit 4;
1. IDK 
