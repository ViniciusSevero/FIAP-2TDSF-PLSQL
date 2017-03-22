SET SERVEROUTPUT ON
DECLARE
  today DATE := sysdate;
  tomorow today%type;
BEGIN
  tomorow := today + 1;
  DBMS_OUTPUT.PUT_LINE('HELLO WOLD');
  DBMS_OUTPUT.PUT_LINE('TODAYS IS '||today);
  DBMS_OUTPUT.PUT_LINE('TOMORROW IS '||tomorow);
END;
/
