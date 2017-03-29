SET SERVEROUTPUT ON


VARIABLE dept_id NUMBER

DECLARE
  dept_name departments.department_name%TYPE := 'Education';
   max_depto NUMBER(4,0);
BEGIN
  SELECT MAX(DEPARTMENT_ID) 
  INTO max_depto
  FROM DEPARTMENTS;
  DBMS_OUTPUT.PUT_LINE(max_depto);
  
  :dept_id :=  max_depto + 10;

	INSERT INTO departments
  (department_name,department_id,location_id)
  
	VALUES(dept_name,:dept_id,NULL);
  
	DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' lINHAS INSERIDAS');
END;

/

SET SERVEROUTPUT OFF

SELECT * FROM departments WHERE department_id = :dept_id;