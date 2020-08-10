-- Name: William Chan
-- File: SQLex06-william
-- Date: 8/6/2020
use tsqlv4;
go 


drop table if exists customers;
go
create table dbo.customers(
	customerNumber int, 
	customerName varchar(50),
	contactLastName varchar(50),
	contactFirstName varchar (50),
	Phone varchar(50),
	addressLine1 varchar(50),
	addressLine2 varchar(50),
	city varchar(50),
	state_ varchar(50),
	postalCode varchar(50),
	country varchar(60),
	salesRepEmployeeNumber varchar(50),
	creditLimit money, 
	CONSTRAINT cust_Name PRIMARY KEY(customerNumber) 
	);
	go

	ALTER TABLE customers
	ADD FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber)


select * from dbo.customers;

 BULK INSERT dbo.customers FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\Customers.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go


drop table if exists employees;
go
create table dbo.employees(
	employeeNumber varchar(50), 
	lastName varchar(50),
	firstName varchar (50),
	extension varchar(50),
	email varchar(50),
	officeCode int,
	reportsTo varchar(50),
	jobTitle varchar(50),
	constraint emp_pk primary key (employeeNumber)
	);
	go

	ALTER TABLE employees
	ADD FOREIGN KEY (officeCode) REFERENCES offices(officeCode);

	select * from dbo.employees;

	BULK INSERT dbo.employees FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\Employees.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go


drop table if exists offices;
go
create table dbo.offices(
	officeCode int, 
	city varchar(50),
	phone varchar (50),
	addressLine1 varchar(50),
	addressLine2 varchar(50),
	state_ varchar(50),
	country varchar(50),
	postalCode varchar(50),
	territory varchar(50),
	CONSTRAINT office_Code PRIMARY KEY(officeCode)
	);
	go

	select * from dbo.offices;

	BULK INSERT dbo.offices FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\offices.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go

drop table if exists orderdetails;
go
create table dbo.orderdetails(
	orderNumber int, 
	productCode varchar(50),
	quantityOrdered int,
	priceEach money,
	orderLineNumber int,
	CONSTRAINT pri_Key PRIMARY KEY(orderNumber, productCode)	
	);
	go
	select * from dbo.orderdetails;

	ALTER TABLE orderdetails
	ADD FOREIGN KEY (productCode) REFERENCES products(productCode);
	ALTER TABLE orderdetails
	ADD FOREIGN KEY (ordernumber) REFERENCES orders(ordernumber);

	BULK INSERT dbo.orderdetails FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\orderdetails.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go

drop table if exists orders;
go
create table dbo.orders(
	orderNumber int, 
	orderdate date,
	requiredDate date,
	shippedDate varchar(50),
	status_ varchar(50),
	comments varchar(MAX),
	customerNumber int
	CONSTRAINT ONum_pri_key PRIMARY KEY(orderNumber)
	);
	go
	select * from dbo.orders;

	ALTER TABLE orders
	ADD FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber);

	BULK INSERT dbo.orders FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\orders.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go

drop table if exists productLines;
go
create table dbo.productLines(
	productLine varchar(50), 
	textDescription varchar(MAX),
	htmlDescription varchar(50),
	image_ varchar(50),
	CONSTRAINT prodLine_pri_key PRIMARY KEY(productLine)
	);
	go
	select * from dbo.productLines;

	ALTER TABLE productLines
	ADD FOREIGN KEY (productLine) REFERENCES productLines(productLine);

	BULK INSERT dbo.productLines FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\productLines.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go

drop table if exists products;
go
create table dbo.products(
	productCode varchar(50), 
	productName varchar(50),
	productLine varchar (50),
	productScale varchar (50),
	productVendor varchar(50),
	productDescription varchar(MAX),
	quantityInStock int,
	buyPrice money,
	MSRP money,
	CONSTRAINT products_pri_key PRIMARY KEY(productCode)
	);
	go
	select * from dbo.products;

	ALTER TABLE products
	ADD FOREIGN KEY (productLine) REFERENCES productLines(productLine);

	BULK INSERT dbo.products FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\products.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go


drop table if exists payments;
go
create table dbo.payments(
	customerNumber int, 
	checkNumber varchar(50),
	paymentDate date,
	amount money
	CONSTRAINT payment_pri_key PRIMARY KEY(checkNumber)
	);
	go

	BULK INSERT dbo.payments FROM 'D:\quantico06\ISTA420\exercises\SQLEX_06-william\payments.txt'
 WITH
 (
 format = 'csv',
 DATAFILETYPE = 'char' ,
 --FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go

ALTER TABLE payments
	ADD FOREIGN KEY (customerNumber) REFERENCES customers(customerNumber);


select * from payments order by customerNumber


--(a) How many distinct products does ClassicModels sell?

with c as(
select od.productCode as pCode, sum(od.quantityOrdered) as sumNum from dbo.orderdetails od
inner join dbo.products p on od.productCode = p.productCode 
group by p.productLine, od.productCode
having p.productLine like 'Classic %'
)
select count(C.pcode) as num_distinct_prodects_sold
from c;

--(b) Report the name and city of customers who don't have sales representatives?

select customerName, city from customers
where salesRepEmployeeNumber = 'NULL';

--(c) What are the names of executives with VP or Manager in their title? Use the CONCAT function
--to combine the employee's frst name and last name into a single field for reporting.

select jobtitle, CONCAT(firstName,' ',lastname) as names from employees
where jobTitle  like '%Manager%' or jobTitle like 'VP%' 
or jobTitle like 'President';

--(d) Which orders have a value greater than $5,000?

select * from orders;
select * from orderdetails;

select od.productCode, od.orderNumber, sum(od.quantityordered * od.priceeach)
as order_value from orderdetails od
group by od.productCode, od.orderNumber
having sum(od.quantityordered * od.priceeach) > 5000;

--(e) Report the account representative for each customer.
select c.customerName, CONCAT(e.firstName,' ',e.lastname)as account_rep
from customers c inner join employees e 
on c.salesRepEmployeeNumber = e.employeeNumber;

--(f) Report total payments for Atelier graphique.

select sum(p.amount) as total_payment, c.customername from payments p
inner join customers c on c.customerNumber = p.customerNumber
group by c.customerName having c.customerName = 'Atelier graphique';

--(g) Report the total payments by date

select sum(p.amount) as total_payment, p.paymentDate from payments p
group by p.paymentDate

--(h) Report the products that have not been sold.

select * from products where productCode = 
(select productCode from products 
except
select productCode from orderdetails);

--(i) List the amount paid by each customer.
select c.customername, sum(p.amount) as amount_paid from payments p
inner join customers c on c.customerNumber = p.customerNumber
group by c.customerName

--(j) List products sold by order date.

select o.orderdate, od.productcode, p.productName from orders o
inner join orderdetails od on od.orderNumber = o.orderNumber
inner join products p on p.productCode = od.productCode 

--(k) List the order dates in descending order for orders for the 1940 Ford Pickup Truck.

select o.orderNumber, o.orderdate, p.productName from orders o
inner join orderdetails od on od.orderNumber = o.orderNumber
inner join products p on p.productCode = od.productCode 
where p.productName like '1940 Ford Pi%'
order by o.orderdate desc

--(l) List the names of customers and their corresponding order number where a particular order from
--that customer has a value greater than $25,000?with D as(select od.orderNumber as odNum, sum(od.quantityordered * od.priceeach) as total_Valuefrom orderdetails odgroup by od.orderNumber having sum(od.quantityordered * od.priceeach) > 25000)select c.customerName, O.orderNumber, D.total_value from D inner join orders o on o.orderNumber = d.odNuminner join customers c on c.customerNumber = o.customerNumber;--(m) Compute the commission for each sales representative, assuming the commission is 5% of the
--value of an order. Sort by employee last name and first name.


select e.lastname as eLastName, e.firstname as eFirstName,
sum(od.quantityOrdered * od.quantityOrdered * 0.05)
as commission
from employees e
inner join customers c on c.salesRepEmployeeNumber = e.employeeNumber
inner join orders o on o.customerNumber = c.customerNumber
inner join orderdetails od on  od.orderNumber = o.orderNumber
group by e.lastName, e.firstName
order by e.lastName, e.firstName

--(n) What is the difference in days between the most recent and oldest order date in the Orders file?

select datediff(day, min(orderdate), max(orderdate)) 
as most_recent_latest_orderday_diff
from orders 

--(o) Compute the average time between order date and ship date for each customer ordered by the
--largest difference.

update dbo.orders
set shippedDate = ''
where shippedDate = 'NULL'

alter table dbo.orders Alter Column shippedDate date 

select * from orderdetails
select * from orders