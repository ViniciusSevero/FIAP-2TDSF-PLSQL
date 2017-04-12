--create table tb_mensagem(msg VARCHAR2(255));

set SERVEROUTPUT ON

begin
  FOR i IN 1..10 LOOP
    IF I = 6 OR I = 8 THEN
      NULL; --FAZ NADA
    ELSE
      INSERT INTO TB_MENSAGEM(MSG) VALUES(i);
    END IF;
  END LOOP;
  commit;
end;
/

SELECT * FROM TB_MENSAGEM;