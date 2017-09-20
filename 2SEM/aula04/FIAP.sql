CREATE OR REPLACE FUNCTION get_sal
 (id employees.employee_id%TYPE) RETURN NUMBER IS
  sal employees.salary%TYPE := 0;
BEGIN
  SELECT salary
  INTO   sal
  FROM   employees         
  WHERE  employee_id = id;
  RETURN sal;
END get_sal;
/

SET SERVEROUTPUT ON
BEGIN
DBMS_OUTPUT.PUT_LINE(get_sal(100));
END;