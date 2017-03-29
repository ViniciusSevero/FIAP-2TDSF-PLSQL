SET SERVEROUTPUT ON

VARIABLE dept_id NUMBER(4,0)
DECLARE
  dept_name departments.department_name%TYPE := 'Education';
BEGIN
  SELECT MAX(DEPARTMENT_ID)
  INTO :dept_id
  FROM DEPARTMENTS;
  
  UPDATE departments
  SET location_id = 3000
  WHERE department_id = :dept_id;
  
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' lINHAS ALTERADA');
END;
/
SET SERVEROUTPUT OFF

SELECT * FROM departments where DEPARTMENT_ID = :dept_id ORDER BY DEPARTMENT_ID;
