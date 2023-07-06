21.
--Display manager ID and number of employees managed by the manager.

select 
    MANAGER_ID,
    COUNT(EMPLOYEE_ID) as Number_of_Employees
        from hr.employees
        GROUP BY MANAGER_ID;


22.

-- Show minimum, average and maximum salary in last 15 years according to job id.

select 
    min(salary) as Min_Salary,
    max(salary) as Max_Salary,
    avg(salary) as Avg_Salary
from hr.employees
    group by JOB_ID;

23.

--  How many employees hired after 2005 for each department?

select 
    department_id,
	count(employee_id)    
from hr.employees
    where extract(year from hire_date) < 2005
    group by department_id;

24.

-- Write a query to show departments in which the difference between maximum and minimum
-- salary is greater than 5000.

select 
    department_id,
    max(salary) as Max_Salary,
    min(salary) as Min_Salary
from hr.employees
	group by DEPARTMENT_ID
    having  max(salary) - min(salary) > 5000;

25.

-- How many people has job id with average salary between 3000 and 7000?

select job_id,
       avg(salary) as Average_Salary
    from hr.employees
    group by job_id
    having avg(salary) between 3000 and 7000;
