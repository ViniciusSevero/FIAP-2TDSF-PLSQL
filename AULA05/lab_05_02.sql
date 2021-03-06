--CREATE TABLE EMP AS SELECT * FROM EMPLOYEES;
--ALTER TABLE EMP ADD STARS VARCHAR2(100);
DEFINE  EMPNO = 176;
SET SERVEROUTPUT ON
--DESCRIBE EMP;
DECLARE
  ASTERISK EMP.STARS%TYPE;
  SAL EMP.SALARY%TYPE;
  QT_ASTERISK NUMBER;
  EMPNO EMP.EMPLOYEE_ID%TYPE := &EMPNO;
BEGIN
  SELECT SALARY INTO SAL FROM EMP  WHERE EMPLOYEE_ID = EMPNO;
  QT_ASTERISK := ROUND((SAL / 1000));
  FOR i IN 1..QT_ASTERISK LOOP
    ASTERISK := ASTERISK || '*';
  END LOOP;
  
  UPDATE EMP SET STARS = ASTERISK WHERE EMPLOYEE_ID = EMPNO;
  commit;
END;
/
SELECT * FROM EMP WHERE EMPLOYEE_ID = 176;