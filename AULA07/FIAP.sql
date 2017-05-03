SET SERVEROUTPUT ON
declare
  cursor emp_cursor is 
  select employee_id,LAST_NAME from EMPLOYEES
  where DEPARTMENT_ID = 30;
--  empno employees.employee_id%TYPE;
--  lname EMPLOYEES.LAST_NAME%TYPE;
--  emp_record emp_cursor%ROWTYPE;
begin
  --open emp_cursor;
/*LOOP
    fetch emp_cursor into emp_record;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.LAST_NAME);
  END LOOP;
*/
  --close emp_cursor;
  FOR emp_record in emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.LAST_NAME);
  END LOOP;
end;
/