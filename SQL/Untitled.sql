/*Creating a table in SQL
create table EmployeeDemo
(Id int,
Name varchar(50)
)
*/

/* Inserting values inside the table name 
Insert into EmployeeDemo Values
(1, 'Sonam Sherpa')


/* Slelecting all data from tablename
select * from EmployeeDemography
*/

/* Selecting a specific data from the table 
select EmpolyeeID, firstname
from employeeDemography
where EmpolyeeID > 1000
*/

/* Different types of select queries */
-- Select distinct (empolyeeID) from employeeDemography
-- Select Count(*) from EmployeeDemography
-- Select count(*) from EmployeeDemography where Gender = 'Male'

/* Using the 'AS' syntax for naming the cloumn. */
-- select count(Gender) as gender from EmployeeDemography

/*Using the max to find the max value of a cloumn 
select max(salary) from EmployeeSalary*/


/* Using the tablename and db name to select all row and col
select * from demo.EmployeeSalary */

/*Using the where statements
=,<>,<,>,AND,Or,Like,Null. Not Null, insert
*/

-- select * from EmployeeDemography where age >10

-- select * from EmployeeDemography where lastName like 'S%'

/* Selecting the values of the row which max values
select * from EmployeeSalary where Salary = (select max(salary) from EmployeeSalary) */

/*not selecting the null values*/
-- select * from EmployeeDemography where FirstName is not NULL

/*Using the In cases in SQL */
/* In is used to select multiple name like '=' */
-- select * from EmployeeDemography where firstName in ('Jim', 'Michael')

