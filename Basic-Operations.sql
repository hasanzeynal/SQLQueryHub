Beginner Level

--1. Write a query in SQL to display job Title, the difference between minimum and maximum salaries
-- for those jobs which max salary within the range 12000 to 18000.

select JOB_TITLE,MAX_SALARY - MIN_SALARY as SALARY_DIFF from hr.jobs
where MAX_SALARY - MIN_SALARY between 12000 and 18000;

--2. Display the details of the employees who have no commission percentage and whose salary is
-- within the range 7000 to 12000 for those employees who are not working in the departments
-- 50,30 and 80.

select * from hr.employees
    where (COMMISSION_PCT is not null) and 
    	  (SALARY between 7000 and 12000) and
          (DEPARTMENT_ID not in(
    30,
    50,
    80
    	));

--3. Write a query in SQL to display the full name (first name and last name), hire date, commission
-- percentage, email and telephone separated by '-', and salary for those employees whose salary
-- is above 11000 and make the result set in a descending order by the full name.

select FIRST_NAME, 
       LAST_NAME, 
       FIRST_NAME || ' ' || LAST_NAME as FULL_NAME, 
       HIRE_DATE, COMMISSION_PCT,
       EMAIL || ' - ' || PHONE_NUMBER as CONTACT_INFO,
       SALARY
    from hr.employees
    where SALARY > 11000 
    	  order by FIRST_NAME || ' ' || LAST_NAME desc;

-- 4. Write a query in SQL to display the first and last name, and salary for those employees whose first
-- name is ending with the letter “m” and they have been hired before June 5th, 2010.

select FIRST_NAME,
       LAST_NAME,
       SALARY
    from hr.employees
    where HIRE_DATE < '05-JUN-10' and
          FIRST_NAME like '%m';

-- 5. Display the full name (first and last), the phone number and email separated by hyphen, and
-- salary, for those employees whose salary is not within the range of 9000 and 17000 and
-- commission is not null. The column headings assign with Full_Name, Contact _Details and
-- Remuneration respectively.

select  FIRST_NAME || ' ' || LAST_NAME as Full_Name,
    	PHONE_NUMBER || '---' || EMAIL as Contact_Details,
    	SALARY as Remuneration
    from hr.employees
    where (SALARY not between 9000 and 17000) and
    	  (COMMISSION_PCT is not null);

--6. Write a query in SQL to display all the information about the department Marketing.

select * from hr.departments;

--7. Write a query to display data from job_history and make the result set in descending order by the
-- epmloyee_id and ascending order by start date.

select * from hr.job_history
    order by EMPLOYEE_ID desc, START_DATE asc;

-- 8.Write a query to display job_id and salary of employees whose phone number starts with 515 or
-- 590 and was hired after 2003 by sorting hire_date and salary in ascending way.

select JOB_ID,
       SALARY
    from hr.employees
    where (PHONE_NUMBER like '515%' or PHONE_NUMBER like '590%') and
    	  (HIRE_DATE < '01-JAN-03')
    order by HIRE_DATE,SALARY asc;


--9. Write a query to display employees who were hired in 2001.

--solution 1
select * from hr.employees
    where HIRE_DATE between '01-JAN-01' and '31-DEC-01';

--solution 2
select * from  hr.employees
	where HIRE_DATE like '%01'

--10. Write a query to display employees’ first and last name who were not hired in 2006 and 2007.

select FIRST_NAME, FIRST_NAME  
    from hr.employees
    where hire_date not like '%06' and hire_date not like '%07';
