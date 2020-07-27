-- Name: William Chan
-- File: quiz04-William.sql
-- Date: July 23, 2020

USE TSQLV4;
-- 1. Write a query that returns the company name, contact name, and city of all customers who made an
--order on the last date that orders were taken. Use nested self contained, list valued subqueries in the
--WHERE clause.

select c.companyname, c.contactname, c.city from sales.Customers as c
inner join sales.orders as o on c.custid = o.custid 
where o.orderdate = (select max(o.orderdate) from sales.orders as o); 

-- 2. Write a query that returns the company name, contact name, and city of all customers who made an
--order in July, 2014. Use nested self contained, list valued subqueries in the WHERE clause.

select c.companyname, c.contactname, c.city from sales.Customers as c
inner join sales.orders as o on c.custid = o.custid
where o.orderdate in (select o.orderdate from sales.Orders as o 
where o.orderdate like '2014-07-%') 

-- 3.Write a query that returns the customer ID, order ID, order date, and the unit price of the highest
--priced item in the order for all orders shipped to Norway. Use a self contained, scalar valued subquery
--in the SELECT clause. 

select o.custid, od.orderid, o.orderdate, max(od.unitprice) as maxunitp from Sales.OrderDetails as od
inner join sales.Orders as o on od.orderid = o.orderid
group by o.custid, od.orderid, o.orderdate, o.shipcountry
having o.shipcountry = 
(select distinct shipcountry from sales.Orders where shipcountry like 'Norway')









