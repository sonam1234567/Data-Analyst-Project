/* Partition by */
/*
select FirstName, lastName, Gender, Salary, Count(Gender) Over (Partition by gender) as TotalGender 
from EmployeeDemography as Demo
join EmployeeSalary as Sal
On Demo.EmpolyeeID = Sal.EmployeeID
*/

/* CTE - It is a temporary table created for users help.
temporary named result sets created from a simple SELECT statement that can be used in a subsequent SELECT statement */
/*
with CTE_employee as 
(select FirstName, lastName, Gender, Salary, 
Count(Gender) Over (Partition by gender) as TotalGender,
Avg(Salary) Over (Partition by salary) as AverageSalary 
from EmployeeDemography as Demo
join EmployeeSalary as Sal
On Demo.EmpolyeeID = Sal.EmployeeID)
select * from CTE_employee
*/

/*Temp Table */
/*
Create temporary table customers(
Id int,
name varchar(50))
*/
-- select * from customers
-- insert into customers values(1001,'Sonam')
-- drop table customers

