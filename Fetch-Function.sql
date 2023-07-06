--  Select the 3 employees with minimum salary for department id 50.

select 
    salary 
from hr.employees
    where DEPARTMENT_ID = 50
order by salary asc
    fetch first 3 rows only;
