/* Inner joints, full/Left/Right Outer joins */

/*The below query takes all the common employeeID from both the salary and demography table. 

select * from EmployeeDemography
inner join EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID

*/

/* Every data in the left table plus the right overlapping data is going to be extracted.

select * from EmployeeDemography
left OUTER join EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID

*/

/* Every data in the right table plus the left overlapping data is going to be extracted. 
select * from EmployeeDemography
right OUTER join EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID

*/

/* Mysql doesn't explicitly support full outer join so we need to do the below
to fet the full outer join 
select * from EmployeeDemography
left OUTER JOIN EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID
Union
select * from EmployeeDemography
right OUTER JOIN EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID

*/

/* select exactky what columns we want
select EmployeeDemography.EmpolyeeID,FirstName,lastName,JobTitle
from EmployeeDemography
right OUTER JOIN EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID

 */
 
 
select JobTitle,avg(salary) from EmployeeDemography
inner JOIN EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID
where JobTitle = 'Salesman'
group by jobtitle