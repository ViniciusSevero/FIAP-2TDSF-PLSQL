DECLARE
  v_hire_date      employees.hire_date%TYPE;
  v_sysdate        v_hire_date%TYPE;
  v_employee_id    employees.employee_id%TYPE := 176;        
BEGIN
  SELECT 	hire_date, sysdate
  INTO   	v_hire_date, v_sysdate
  FROM   	employees
  WHERE  	employee_id = v_employee_id;        
END;
/
