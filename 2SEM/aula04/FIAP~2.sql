CREATE OR REPLACE FUNCTION get_job
 (id JOBS.JOB_ID%TYPE) RETURN VARCHAR IS
  title JOBS.JOB_TITLE%TYPE := '';
BEGIN
  SELECT JOB_TITLE
  INTO   title
  FROM   JOBS
  WHERE  JOB_ID = id;
  RETURN title;
END get_job;
/


SET SERVEROUTPUT ON
DECLARE sal employees.salary%type;
BEGIN
 DBMS_OUTPUT.PUT_LINE(get_job('SA_REP'));
END;
/
