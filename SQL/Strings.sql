/* String Functions */

/*
create table EmployeeErrors(
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)
*/

/*
Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')
*/

-- select employeeID, Trim(employeeID) as IDTRIM from EmployeeErrors

-- select employeeID, LTrim(employeeID) as IDTRIM from EmployeeErrors

-- select employeeID, RTrim(employeeID) as IDTRIM from EmployeeErrors


-- select LastName, REPLACE(lastName, '- Fired', ' ') as lastNameFixed from EmployeeErrors

/*
Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemography dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)
*/

-- select firstName, Upper(firstname) as CapsName from EmployeeErrors

