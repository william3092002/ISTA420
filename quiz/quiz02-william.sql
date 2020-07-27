.echo on 
.headers on

-- Name: William Chan
-- File: quiz02-william.sql
-- Date: July 9, 2020

--1. How many seafood products do we have?
select count(productname) as number_of_seafood_p from products where categoryid = 8;

--2. What are the names and IDs of our seafood products?
select productname, productid from products where categoryid = 8;

--3. What is the average price of our seafood products?
select (sum(unitsinstock * unitprice)/sum(unitsinstock)) as average_price_of_s from products where categoryid = 8;

--4. What is our highest priced seafood product, and how much does it cost?
select productname, max(unitprice) from products where categoryid = 8;

--5. What is our lowest priced seafood product, and how much does it cost?
select productname, min(unitprice) from products where categoryid = 8;

--6. How many customers do we have in Denmark?
select count(customerid) from customers where country = "Denmark";

--7. What are the customer names and IDs of our Danish customers?
select contactname, customerid from customers where country = "Denmark";

--8. Which customers do NOT have a fax number?
select customerid, fax from customers where fax not like ('_%');