-- Find number of employees with same name.

select 
    count(FIRST_NAME),
    first_name
    from hr.employees
    group by FIRST_NAME
    order by count(FIRST_NAME) desc;


-- How many people with the same phone code work in departments 50 and 90?

select 
    count(substr(phone_number,1,3)) as Number_of_People
    from hr.employees
where department_id in (50,90)
    group by substr(phone_number,1,3);



-- Display departments with sum salary of employees more than 5 in spring and autumn.

select 
    DEPARTMENT_NAME,
    count(employee_id) as Number_of_Employers
from hr.employees E
    left join hr.departments D
    on D.DEPARTMENT_ID = E.DEPARTMENT_ID
    where  case
    when extract(month from hire_date) in (5,6,7) then 'Yay'
    when extract(month from hire_date) in (8,9,10) then 'Yaz'
    when extract(month from hire_date) in (11,12,1) then 'Payiz'
    else 'Qis' end   in ('Yaz','Payiz')
group by DEPARTMENT_NAME
    having count(employee_id) >=5;



--Display last name, job title of employees who have commission percentage and belongs to
-- department 30.

select 
    last_name, 
    JOB_TITLE,
    COMMISSION_PCT,
    DEPARTMENT_ID
from hr.jobs J
    right join hr.employees E
    on E.JOB_ID = J.JOB_ID
where COMMISSION_PCT is not null and DEPARTMENT_ID = 30;
