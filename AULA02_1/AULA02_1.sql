cl scr
SET SERVEROUTPUT ON
set feed off
declare 
  dia int := 15;
begin
  DBMS_OUTPUT.PUT_LINE('hello world'||' dia '||dia);
end;
/
SET SERVEROUTPUT OFF
set feed on
