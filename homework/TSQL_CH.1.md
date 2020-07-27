# TSQL Homework 01

1. A declarative programing language requires you to specify what you want to get and not how to get it. Leaving the RDBMS figure out the physical mechanics required to process your request.

1. * Data Definition Language (DDL)
	* Data Manipulation Language (DML)
	* Data Control Language (DCL)

1. * Joined digitzied data from multiple sets
	* Digitized data from Human Resources 

1. entity and referential integrity. Ensure the database is accute. 

1. * two value = true or false
	* three value = true, false or missing value
	* four value = true, false, unknown and applicable or unknown and unapplicable
	* true, false or null
	
1. Primary/candidate keys. Entity integrity ensures that there are no duplicate records within the table and that the field that id
entifies each record within the table is unique and never null

1. foreign keys. The accuracy and consistency of data within a relationship.

1. set/table

1. no. because 1NF requires that each cell be of single valued. Have multiple facID for multiple facCreds

1. no. because you can find out owner's F/L name based on owner id alone. ownerID (pk), FN and LN in one table; petID (pk), petN and petT in another table; a third table combine both ownerID and petID.

1. yes. because all nonkey attributes are dependent on candidate keys nontransitively.

1. server name, database name, schema name, object name.

1. declarative data integrity is enforced as part of the model while procedural data integrity is enforced with code. 