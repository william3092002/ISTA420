.echo on
.headers on

-- Name: William Chan
-- File: Charel's family.sql
-- Date: July 2, 2020

drop table if exists family;

create table family (
	id int,
	name text,
	sex int,
	role text
);

insert  into family values (1,"Charles",1,"parent");
insert  into family values (2,"Bonnie",0,"parent");
insert  into family values (3,"Casie",0,"child");
insert  into family values (4,"Jackson",1,"child");
insert  into family values (5,"Midnight",0,"pet");
insert  into family values (6,"Max",1,"pet");

.schema family

select * from family;
select * from family where sex = 1;
select * from family where role like "son";
select * from family where role like "pet";