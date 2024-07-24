/*

Trigger happens when an event takes place.

Delimiter $$

create trigger employee_insert
	after insert on EmployeeSalary
    for each row
begin
	insert into EmployeeDemography(employeeID)
    values (new.employeeID);
end $$
delimiter ;
*/
-- drop trigger employee_insert
-- insert into EmployeeSalary(employeeID) values (1015)
-- alter table EmployeeDemography rename column empolyeeID to employeeID

/* Events is scheduled or scheduled automator */
-- select * from EmployeeDemography

/*
Delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete
    from EmployeeDemography
    where age >=40;
end $$
Delimiter ;
*/

/* check if the event scheduler is on or off */
show variables like 'event%';
/* deleting the event scheduler */
-- drop event delete_retirees