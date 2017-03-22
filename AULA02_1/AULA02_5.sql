SET SERVEROUTPUT ON
VARIABLE basic_percent NUMBER;
VARIABLE pf_percent NUMBER;
DECLARE
  today DATE := sysdate;
  tomorow today%type;
BEGIN
  :basic_percent := 45;
  :pf_percent := 12;
  tomorow := today + 1;
  DBMS_OUTPUT.PUT_LINE('HELLO WOLD');
  DBMS_OUTPUT.PUT_LINE('TODAYS IS '||today);
  DBMS_OUTPUT.PUT_LINE('TOMORROW IS '||tomorow);
END;
/
PRINT basic_percent;
PRINT pf_percent;
