SET SERVEROUTPUT ON
ACCEPT emp_num PROMPT 'NÚMERO DO FUNCIONÁRIO'

declare
  emp_num   NUMBER(3) := &emp_num;
  emp_sal EMPLOYEES.SALARY%TYPE;
  perc NUMBER(3,2);
begin
  SELECT SALARY INTO emp_sal FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_num;
  IF emp_sal < 3000 THEN
    perc := 0.1;
  ELSIF emp_sal <= 5000 THEN
    perc := 0.15;
  ELSE
    perc := 0.20;
  END IF;
  
  SYS.DBMS_OUTPUT.PUT_LINE(emp_sal);
  UPDATE EMPLOYEES SET SALARY = SALARY + (SALARY * perc) WHERE EMPLOYEE_ID = emp_num; 
  
  SELECT SALARY INTO emp_sal FROM EMPLOYEES WHERE EMPLOYEE_ID = emp_num;
  SYS.DBMS_OUTPUT.PUT_LINE(emp_sal);
  
  COMMIT;
end;
/