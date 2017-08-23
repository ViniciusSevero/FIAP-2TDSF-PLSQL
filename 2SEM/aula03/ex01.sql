SET SERVEROUTPUT ON
 ACCEPT promptSalario PROMPT 'SALÁRIO...' 

DECLARE
  salario EMPLOYEES.SALARY%TYPE := &promptSalario;
  nome EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
  select FIRST_NAME into nome from EMPLOYEES where salary = salario;
  DBMS_OUTPUT.PUT_LINE(nome || ' - ' || salario);
  insert into MESSAGES values(nome || ' - ' || salario);
  commit;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No employee with a salary of '|| salario);
    insert into MESSAGES values('No employee with a salary of '|| salario);
    commit;
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('More than one employee with a salary of '|| salario);
    insert into MESSAGES values('More than one employee with a salary of '|| salario);
    commit;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Some other error occurred');
    insert into MESSAGES values('Some other error occurred');
    commit;
END;
/