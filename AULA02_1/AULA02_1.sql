cl scr
SET SERVEROUTPUT ON
set feed off
begin
  DBMS_OUTPUT.PUT_LINE('hello');
end;
/
SET SERVEROUTPUT OFF
set feed on
