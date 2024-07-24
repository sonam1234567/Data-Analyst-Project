/* Union, Union all */

-- Inorder to perform the union we need to have equal columns.
-- The union takes only the distinct values
/*
select * from EmployeeDemography 
Union
select * from EmployeeDemo
*/

-- The union all considers all the values even the duplicate ones unlike union
/*
select * from EmployeeDemography 
Union all
select * from EmployeeDemo
order by EmpolyeeID
*/

/* The below script works but gives us an invlaid values. It works as it has similar datatypes in column and same number of column.
When using union we need to make sure we are using union for same data tables.
select EmpolyeeID, Firstname, Age from EmployeeDemography 
Union all
select EmployeeID, JobTitle, Salary from EmployeeSalary
order by EmpolyeeID
*/