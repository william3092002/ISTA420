.echo on
.headers on

-- Name: William Chan
-- Assignment Name: SQL Programming Exercise 01
-- Date: July 2, 2020

drop table if exists pets;

create table pets (
	id int primary key,
	name text,
	birth place text, 
	color text,
	weight float
);

insert into pets values (1,"Lipton","Indiana","orange and white",10.5);
insert into pets values (2,"Senyong","Indiana","orange and white",13.8);
insert into pets values (3,"Miaoko","Indiana","black and white",11.7);
insert into pets values (4,"Miaomi","Michigan","grey",15.5);
insert into pets values (5,"Rocky","Turkmenistan","dirt brown",18.5);

.schema pets

select * from pets;
select * from pets where (weight > 15);
select * from pets where birth like "Turkmenistan"; 
select name from pets where id = 3;  
