--create table tb_mensagem(msg VARCHAR2(255));

set SERVEROUTPUT ON

DECLARE
  i NUMERIC := 1;
begin
  WHILE i <= 10 LOOP
    IF i = 6 OR i = 8 THEN
      NULL; --FAZ NADA
    ELSE
      INSERT INTO TB_MENSAGEM(MSG) VALUES(i);
    END IF;
    i := i + 1;
  END LOOP;
  commit;
end;
/

SELECT * FROM TB_MENSAGEM;