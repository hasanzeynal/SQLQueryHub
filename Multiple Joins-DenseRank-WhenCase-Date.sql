-- Create a category called “seasons” and find in which season most employees were hired.

select 
    count(hire_date) as Max_Hired_Season,
    case
        when extract(month from hire_date) in (3,4,5) then 'Spring'
    	when extract(month from hire_date) in (6,7,8) then 'Summer'
    	when extract(month from hire_date) in (9,10,11) then 'Autumn'
        else 'Winter' end seasons
    from hr.employees
    group by case
        when extract(month from hire_date) in (3,4,5) then 'Spring'
    	when extract(month from hire_date) in (6,7,8) then 'Summer'
    	when extract(month from hire_date) in (9,10,11) then 'Autumn'
        else 'Winter' end 
    order by count(hire_date) desc;


-- Find the cities of employees with average salary more than 5000.

select 
    city,
    round(avg(salary),0) as Average_Salary
    from hr.employees E
left join hr.departments D
    on E.DEPARTMENT_ID = D.DEPARTMENT_ID
left join hr.locations L
    on L.LOCATION_ID = D.LOCATION_ID
	group by city;


-- Return the name of the employee with the lowest salary in department 90.

select min(salary) as Min_Salary
    from hr.employees
    group by DEPARTMENT_ID
    having DEPARTMENT_ID = 90;


-- 2. Select the department name, employee name, and salary of all employees who work in the
-- human resources or purchasing departments. Compute a rank for each unique salary in both
-- departments.

select 
    DEPARTMENT_NAME,
    FIRST_NAME,
    SALARY,
    DENSE_RANK()
	OVER (PARTITION BY salary
ORDER BY salary asc) as Rank
    from hr.employees E
left join hr.departments D
    on D.DEPARTMENT_ID = E.DEPARTMENT_ID
    where DEPARTMENT_NAME in ('Purchasing','Human Resources');
