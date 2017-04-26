set SERVEROUTPUT ON

define countryid = 'CA'
declare
country_record COUNTRIES%rowtype;
begin
  select * into country_record from COUNTRIES where COUNTRIES.country_id = '&countryid';
  DBMS_OUTPUT.put_line('Codigo: ' || country_record.COUNTRY_ID);
end;
/

--select * from countries;