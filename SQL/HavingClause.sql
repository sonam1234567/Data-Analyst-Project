/* Having clause */
/*
select Jobtitle, count(jobtitle)
from EmployeeDemography join EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID
group by JobTitle
having count(jobtitle) > 1
order by count(JobTitle)
*/


select * from EmployeeDemography
having age > 30
order by age asc