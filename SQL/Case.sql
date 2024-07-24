/* Case Statement 
select Firstname, lastname, Age,
CASE
	when age > 30 then 'old'
    when age between 27 and 30 then 'Young'
    else 'Baby'
end
from EmployeeDemography
where age is not null
order by age asc

*/


select Firstname, lastname, Jobtitle, salary,
case
	when jobtitle = 'salesman' Then salary + (salary * .10)
    when jobtitle = 'accountant' Then salary + (salary * .5)
    when jobtitle = 'HR' Then salary + (salary * .000001)
    Else Salary + (salary * .03)
end as SalaryAfterRaise
from EmployeeDemography join EmployeeSalary
on EmployeeDemography.EmpolyeeID = EmployeeSalary.EmployeeID