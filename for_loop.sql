-- Write a PL/SQL function that takes a department name or ID as input and returns a list of employees (their names) in that department.

declare 
    cursor employee_names is
        select 
            D.Department_name,
            E.first_name || E.last_name as Full_Name       
            from hr.employees E
            left join hr.departments D
        on D.department_id = E.department_id;
begin 
    
for e in employee_names loop
  dbms_output.put_line('The name of Departments: ' || e.department_name || ',' || e.full_name);
  end loop;
end;
/
