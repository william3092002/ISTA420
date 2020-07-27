.echo on 
.headers on

-- Name: William Chan
-- File: SQLex02-william.sql
-- Date: July 9, 2020

--1. List the company name, the contact name and the country of all customers in Poland.
select companyname, contactname, country from customers where country in("Poland");

--2. List the order Id, the order date, and the destination city of all orders shipped to Berlin.
select orderid, orderdate, shipcity from orders where shipaddress like('Berliner%');

--3. How many boxes of Filo Mix do we have in stock?
select sum(quantityperunit * unitsinstock) from products where productname in ("Filo Mix");

--4. List the telephone numbers of all of our shippers.
select * from shippers;

--5. Who is our oldest employee? Who is our youngest employee?
select firstname, lastname, min(birthdate) from employees;
select firstname, lastname, max(birthdate) from employees;

--6. List the suppliers where the owner of the supplier is also the sales contact.
select contactname from suppliers where contacttitle like('Owner');

--7. Mailing Labels From the Northwind database we used in class and SQLite, create mailing labels for customer representatives. Each label should consist of six, and exactly six, lines. The mailing labels should be suitable for printing on sticky label paper, specifcally Avery 8160 labels. The format should be as follows:
select contacttitle || ' ' || contactname ||'
'|| companyname ||'
'|| address ||'
'|| city || ' ' || region || ' ' || postalcode || ' ' || country ||'
'||'
' from customers;

--8 Telephone Book 
--From the Northwind database we used in class and SQLite, create a telephone book for customer representatives. Each line in the telehone book should consist of the representative last name, representative first name, company name, and telephone number. Each row should look like this.
select substr(contactname, 1, instr(contactname, ' ')- 1) ||', '|| substr(contactname, instr(contactname, ' ')+1) || '    '|| companyname || '    ' || phone from customers;