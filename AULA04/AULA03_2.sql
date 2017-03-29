VARIABLE rows_deleted VARCHAR2(30);
DECLARE
  empno employees.employee_id%TYPE := 177;
BEGIN
  DELETE FROM employees 
  WHERE employee_id = empno;
  :rows_deleted := (SQL%ROWCOUNT ||
                       ' row deleted.');
   
  :rows_deleted := (SQL%ROWCOUNT || ' linhas deletada');
END;
/
PRINT rows_deleted;