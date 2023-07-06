11.
-- Write a query to display email, job_id and first name of employees whose hired year was 2007
-- or hired month was 1.

select * 
    from hr.employees
    where HIRE_DATE like '%07' or HIRE_DATE like '%JAN%';


12.
--Write a query to display details of employees who was hired after 2007 or salary is less than
-- 10000.

select * 
    from hr.employees
    where HIRE_DATE < '01-JAN-07'
    and SALARY < 10000;

Week 6 HW

13. 
--Display employees who joined in the month of May.

select * 
    from hr.employees
    where HIRE_DATE like '%MAY%';

14.
--Display the number of days between system date and 1st January 2011.

select round(SYSDATE - to_date('01-JUL-23'),0) as Day_Diff
    from dual;

15. 
--Display maximum salary of employees.

select J.job_id,
       MAX(SALARY) as Max_Salary
    from hr.jobs J
    left join hr.employees E
    on J.JOB_ID = E.JOB_ID
    group by J.job_id;
