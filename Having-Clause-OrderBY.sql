16.
-- Display number of employees in each department.

select 
    DEPARTMENT_ID,
    count(EMPLOYEE_ID) as Number_of_Employees 
from hr.employees
    group by DEPARTMENT_ID;

17. 
--Display number of employees who joined after 15th of month.


select 
    count(hire_date) as Number_of_Employers
from hr.employees
    where extract(day from hire_date) <= 15;

18.

--Display job ID for jobs with average salary more than 10000.

select 
    JOB_ID,
    avg(salary) as Avg_Salary
from hr.employees
    group by JOB_ID
    having avg(salary) > 10000;

19.

--Display average salary of employees in each department who have commission percentage.

select 
    DEPARTMENT_ID,
    round(avg(salary),0)  as Average_Salary
from hr.employees
	where COMMISSION_PCT is not null
    group by DEPARTMENT_ID;

20.
-- Display job ID, number of employees, sum of salary, and difference between the highest
-- salary and the lowest salary of the employees for all jobs.


select 
       E.JOB_ID,
       count(EMPLOYEE_ID) as Number_of_Employers,
       sum(salary) as Sum_of_Salary,
       MAX(salary) - min(salary) as Salary_diff  	
from hr.jobs J
    right join hr.employees E
    on J.JOB_ID = E.JOB_ID
    group by E.JOB_ID;

