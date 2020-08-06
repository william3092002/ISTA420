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

--4. Delete the rst record from your table using the output clause. This is the header.
DELETE FROM dbo.presidents WHERE id = 'id';
--You may combine the following two steps
--Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is NOT NULL and UNIQUE.
--Alter the presidents table by adding the column you created as a primary key column with a new constraint.
ALTER TABLE dbo.presidents ADD pk int not null identity (1, 1)
constraint pk_presidents primary key;


--5. Bring the data up to date by updating the last row. Use the output clause.
UPDATE dbo.presidents
 SET dateLeftOffice = '1/20/2017',
 assassinationAttempt = 'false',
 assassinated = 'false'
 output inserted.dateLeftOffice,
 inserted.assassinationAttempt,
 inserted.assassinated
 where id = '44';

--6. Bring the data up to date by adding a new row. Use the output clause.

 insert into dbo.presidents(id, lastName, firstName, middleName, orderOfPresidency, 
 dateOfBirth, dateOfDeath, townOrCountryOfBirth, stateOfBirth, homeState, partyAffiliation,
 dateTookOffice, dateLeftOffice, assassinationAttempt, assassinated, relgiousAffliation)
 output inserted.id, inserted.lastName, inserted.firstName, inserted.middleName, inserted.orderOfPresidency,
 inserted.dateOfBirth, inserted.dateOfDeath, inserted.townOrCountryOfBirth, inserted.stateOfBirth,
 inserted.homeState, inserted.partyAffiliation, inserted.dateTookOffice, inserted.dateLeftOffice, 
 inserted.assassinationAttempt, inserted.assassinated, inserted.relgiousAffliation
 values ('45', 'Trump', 'Donald', 'J', '45', '6/14/1946', 'NULL' , 'New York', 'New York',
 'Florida', 'Republican', '1/20/2017', 'NULL', 'false', 'false', 'Presbyterian') 

--7. How many presidents from each state belonged to the various political parties? Aggregate by party
--and state. Note that this will in fact be a pivot table.

with A as(
select  homestate, partyAffiliation, count(id) as numPresidents
from dbo.presidents group by partyAffiliation, homeState 
)
SELECT A.homeState,
  SUM(CASE WHEN partyAffiliation = 'Republican' THEN numPresidents END) AS Republican,
  SUM(CASE WHEN partyAffiliation = 'Democratic' THEN numPresidents END) AS Democratic,
  SUM(CASE WHEN partyAffiliation = 'Republican/National Union' THEN numPresidents END) AS republicanNationalUnion,
  SUM(CASE WHEN partyAffiliation = 'Democratic-Republican/National Republican' THEN numPresidents END) AS nationalRepublican,
  SUM(CASE WHEN partyAffiliation = 'Federalist' THEN numPresidents END) AS Federalist,
  SUM(CASE WHEN partyAffiliation = 'Whig' THEN numPresidents END) AS Whig,
  SUM(CASE WHEN partyAffiliation = 'Independent' THEN numPresidents END) AS Independent
FROM A group by A.homeState;

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

--pivot and group by relgiousAffliation
with A as(
select partyAffiliation, relgiousAffliation, count(partyAffiliation) as numPresidents,
convert(decimal(10,2),(100.0 * count(id) / 45)) as pctReligion
from dbo.presidents
group by partyAffiliation, relgiousAffliation)
select a.relgiousAffliation, 
  SUM(CASE WHEN partyAffiliation = 'Republican' THEN numPresidents END) AS Republican,
  SUM(CASE WHEN partyAffiliation = 'Democratic' THEN numPresidents END) AS Democratic,
  SUM(CASE WHEN partyAffiliation = 'Republican/National Union' THEN numPresidents END) AS republicanNationalUnion,
  SUM(CASE WHEN partyAffiliation = 'Democratic/National Union' THEN numPresidents END) AS democraticNationalUnion,
  SUM(CASE WHEN partyAffiliation = 'Democratic-Republican/National Republican' THEN numPresidents END) AS nationalRepublican,
  SUM(CASE WHEN partyAffiliation = 'Democratic-Republican' THEN numPresidents END) AS democraticRepublican,
  SUM(CASE WHEN partyAffiliation = 'Federalist' THEN numPresidents END) AS Federalist,
  SUM(CASE WHEN partyAffiliation = 'Whig' THEN numPresidents END) AS Whig,
  SUM(CASE WHEN partyAffiliation = 'Independent' THEN numPresidents END) AS Independent
from A group by a.relgiousAffliation;

--pivot and group by partyAffiliation
with A as(
select partyAffiliation, relgiousAffliation, count(partyAffiliation) as numPresidents,
convert(decimal(10,2),(100.0 * count(id) / 45)) as pctReligion
from dbo.presidents
group by partyAffiliation, relgiousAffliation)
select a.partyAffiliation, 
SUM(CASE WHEN relgiousAffliation = 'NULL' THEN numPresidents END) AS nonReligious,
SUM(CASE WHEN relgiousAffliation = 'Baptist' THEN numPresidents END) AS Bapist,
SUM(CASE WHEN relgiousAffliation = 'Congregationalist' THEN numPresidents END) AS Congregationalist,
  SUM(CASE WHEN relgiousAffliation = 'Deist/Episcopalian' THEN numPresidents END) AS Deist,
  SUM(CASE WHEN relgiousAffliation = 'Dutch Reformed' THEN numPresidents END) AS dutchReformed,
SUM(CASE WHEN relgiousAffliation = 'Episcopalian' THEN numPresidents END) AS Episcopalian,
  SUM(CASE WHEN relgiousAffliation = 'Methodist' THEN numPresidents END) AS Methodist,
  SUM(CASE WHEN relgiousAffliation = 'Presbyterian' THEN numPresidents END) AS Presbyterian,
  SUM(CASE WHEN relgiousAffliation = 'Presbyterian/Methodist' THEN numPresidents END) AS presbyterianMethodist,
  SUM(CASE WHEN relgiousAffliation = 'Quaker' THEN numPresidents END) AS Quaker,
  SUM(CASE WHEN relgiousAffliation = 'Roman Catholic' THEN numPresidents END) AS romanCatholic,
  SUM(CASE WHEN relgiousAffliation = 'Unaffiliated Christian' THEN numPresidents END) AS unaffiliatedChristian,
  SUM(CASE WHEN relgiousAffliation = 'Unitarian' THEN numPresidents END) AS Unitarian
  from A group by a.partyAffiliation;

  select * from dbo.presidents where assassinationAttempt = 'true';







