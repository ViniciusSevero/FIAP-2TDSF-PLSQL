SET SERVEROUTPUT ON
ACCEPT localizacao PROMPT 'ENDEREÇO...'

DECLARE
  var_country LOCATIONS.COUNTRY_ID%TYPE := &localizacao;
  CURSOR address_cursor IS SELECT STREET_ADDRESS, CITY FROM LOCATIONS WHERE COUNTRY_ID = var_country;
--  address_record address_cursor%ROWTYPE;
BEGIN
--  open address_cursor;

/*  
  LOOP
    fetch address_cursor into address_record;
    EXIT WHEN address_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('RUA ' || address_record.STREET_ADDRESS  || ' CIDADE ' || address_record.CITY );
  END LOOP;
*/

/*
  fetch address_cursor into address_record;
  WHILE address_cursor%FOUND LOOP
     DBMS_OUTPUT.PUT_LINE('RUA ' || address_record.STREET_ADDRESS  || ' CIDADE ' || address_record.CITY );
     fetch address_cursor into address_record;
  END LOOP;
*/

--  close address_cursor;

  FOR address_record in address_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('RUA ' || address_record.STREET_ADDRESS  || ' CIDADE ' || address_record.CITY );
  END LOOP;
END;
/