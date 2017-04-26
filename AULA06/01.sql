--desc employees;
set SERVEROUTPUT ON

declare
emp_record employees%rowtype;
begin
select * into emp_record from employees where employees.employee_id = 100;
DBMS_OUTPUT.put_line('Codigo: ' || emp_record.employee_id);
end;
/