-- Name: William Chan
-- File: SQLex05-william
-- Date: 7/31/2020
use tsqlv4;
go 

--1. Create an appropriate table schema.
drop table if exists presidents;
go

create table dbo.presidents(
	id varchar(50), 
	lastName varchar(50),
	firstName varchar(50),
	middleName varchar (50),
	orderOfPresidency varchar(50),
	dateOfBirth varchar(50),
	dateOfDeath varchar(50),
	townOrCountryOfBirth varchar(50),
	stateOfBirth varchar(50),
	homeState varchar(50),
	partyAffiliation varchar(50),
	dateTookOffice varchar(50),
	dateLeftOffice varchar(50), 
	assassinationAttempt varchar(50),
	assassinated varchar(50),
	relgiousAffliation varchar(50),
	imagePath varchar(50)
	);
	go

--2. Insert the CSV data into the table you just created.
BULK INSERT dbo.presidents FROM 'D:\quantico06\ISTA420\exercises\uspt.txt'
 WITH
 (
 DATAFILETYPE = 'char' ,
 FIELDTERMINATOR = ',',
 ROWTERMINATOR = '\n'
 );
go

--3. Delete the column that contains the path to the images.

ALTER TABLE dbo.presidents DROP COLUMN imagePath;

--4. Delete the rst record from your table using the output clause. This is the header.DELETE FROM dbo.presidents WHERE id = 'id';--You may combine the following two steps--Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is NOT NULL and UNIQUE.
--Alter the presidents table by adding the column you created as a primary key column with a new constraint.
ALTER TABLE dbo.presidents ADD pk int not null identity (1, 1)
constraint pk_presidents primary key;


--5. Bring the data up to date by updating the last row. Use the output clause.UPDATE dbo.presidents
 SET dateLeftOffice = '1/20/2017',
 assassinationAttempt = 'false',
 assassinated = 'false'
 output inserted.dateLeftOffice,
 inserted.assassinationAttempt,
 inserted.assassinated
 where id = '44'

--6. Bring the data up to date by adding a new row. Use the output clause.
 insert into dbo.presidents(id, lastName, firstName, middleName, orderOfPresidency, 
 dateOfBirth, dateOfDeath, townOrCountryOfBirth, stateOfBirth, homeState, partyAffiliation,
 dateTookOffice, dateLeftOffice, assassinationAttempt, assassinated, relgiousAffliation)
 values ('45', 'Trump', 'Donald', 'J', '45', '6/14/1946', 'NULL' , 'New York', 'New York',
 'Florida', 'Republican', '1/20/2017', 'NULL', 'false', 'false', 'Presbyterian') 

 --7. How many presidents from each state belonged to the various political parties? Aggregate by party
--and state. Note that this will in eect be a pivot table.
select  homestate, partyAffiliation, count(id) as numPresidents
from dbo.presidents group by partyAffiliation, homeState; 

--8. Create a report showing the number of days each president was in office.
UPDATE dbo.presidents
 SET dateLeftOffice = '7/31/2020'
 where id = '45'

ALTER TABLE dbo.presidents ALTER COLUMN dateTookOffice date;
ALTER TABLE dbo.presidents ALTER COLUMN dateLeftOffice date;

select firstName, lastName, datetookOffice, dateleftOffice,
datediff(day, datetookOffice, dateleftOffice) as daysOfPresidency
from dbo.presidents;

--9. Create a report showing the age (in years) of each present when he took oce.
ALTER TABLE dbo.presidents ALTER COLUMN dateOfBirth date;

select firstName, lastName, datetookOffice, dateleftOffice,
datediff(year, dateOfBirth, datetookOffice) as yearsOld
from dbo.presidents;

--10. See if there is any correlation between a president's party and reported religion, or lack of reported
--religion.

select partyAffiliation, relgiousAffliation, count(partyAffiliation) as numPresidents,
convert(decimal(10,2),(100.0 * count(id) / 45)) as pctReligion
from dbo.presidents
group by partyAffiliation, relgiousAffliation








