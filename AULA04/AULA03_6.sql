SET SERVEROUTPUT ON
DECLARE
  emp_authorization employees.EMPLOYEE_ID%TYPE;
BEGIN
 SELECT employee_id 
 INTO emp_authorization
 FROM employees
 INNER JOIN departments 
 ON departments.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
 WHERE departments.DEPARTMENT_NAME = 'Human Resources';
 
 DBMS_OUTPUT.PUT_LINE(emp_authorization);
END;
/