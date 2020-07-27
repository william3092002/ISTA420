.echo on
.headers on

-- Name: William Chan
-- File: quiz03-William.sql
-- Date: July 16, 2020

--1.Write a report giving the employee id, first name, last name, and the average amount of all orders by
--that employee. Use the SQL 92 syntax. Do not use a group by clause. Here is my output:
--EmployeeID|FirstName|LastName|average_sale
--7|Robert|King|802.818125
--9|Anne|Dodsworth|775.364485981308
--2|Andrew|Fuller|737.548796680498
--3|Janet|Leverling|663.711214953271
--5|Steven|Buchanan|645.878205128205
--4|Margaret|Peacock|595.684404761905
--1|Nancy|Davolio|585.923797101449
--8|Laura|Callahan|512.696269230769
--6|Michael|Suyama|465.464880952381
 select e.employeeid, e.firstname, e.lastname, sum(od.unitprice * od.quantity)/count(od.orderid) from (employees e join orders o on e.employeeid = o.employeeid) join order_details od on o.orderid = od.orderid group by e.employeeid;
--2. In some cities, we have customers, suppliers, and employees. Write a report that lists the customer’s
--contact name, the supplier’s contact name, the employee’s name, and the city in which all three are
--located. Use the SQL 92 syntax. Do not use a group by clause.
select c.contactname, s.contactname, firstname ||' '|| lastname as employee_name, e.city from (customers c join suppliers s on c.city = s.city) join employees e on e.city = s.city;

