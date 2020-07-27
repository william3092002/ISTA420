.echo on
.headers on

-- Name: William Chan
-- File: quiz03-William.sql
-- Date: July 16, 2020

--1. Using SQLite and the Northwind database, create a line item report that contains a line for each
--product in the order with the following columns: the order id, the product id, the unit price, the
--quantity sold, the line item price, and the percent of that line item constitutes of the total amount of
--the order.
select orderid, productid, unitprice, (unitprice * quantity) as line_total, ((unitprice*quantity)/(sum(unitprice*quantity)))*100 as PctOfTotalOrder from order_details group by productid order by orderid limit 25;
--2. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
--and employees, (b) where we have customers but no employees AND both customers ad employees,
--and (c) where we have employees but no customers AND both customers and employees. Write three
--queries, using inner and outer joins. Report the results of the queries. There is no need for any further
--reporting.
--a.
select c.city, c.region, e.region, c.postalcode, e.postalcode from customers c join employees e on c.city like e.city group by c.city order by e.city;
--b.
select c.city, c.region, e.region, c.postalcode, e.postalcode from customers c left join employees e on c.city like e.city group by c.city order by e.city;
--c.
select e.city, c.city, e.region, c.region, e.postalcode, c.postalcode from employees e left join customers c on e.city like c.city group by e.city order by c.city;