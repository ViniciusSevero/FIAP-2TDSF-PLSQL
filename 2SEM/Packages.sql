CREATE OR REPLACE PACKAGE NAC_ESTADOS
AS
  PROCEDURE CAD_ESTADO(  in_nome IN ESTADO.NOME%TYPE,  in_sigla IN ESTADO.SIGLA%TYPE);
  PROCEDURE CONS_ESTADO(  in_sigla IN ESTADO.SIGLA%TYPE,  out_nome OUT ESTADO.NOME%TYPE);
end NAC_ESTADOS;
/

CREATE OR REPLACE PACKAGE BODY NAC_ESTADOS
AS
  PROCEDURE CAD_ESTADO
  (
    in_nome IN ESTADO.NOME%TYPE,
    in_sigla IN ESTADO.SIGLA%TYPE
  )
  IS
    estado_cadastrado_exception EXCEPTION;
    cont NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO cont FROM ESTADO WHERE SIGLA = in_sigla AND NOME = in_nome;
    
    IF CONT > 0 THEN
      RAISE estado_cadastrado_exception;
    END IF;
  
    INSERT INTO ESTADO VALUES(in_nome, in_sigla);
    DBMS_OUTPUT.PUT_LINE ('O ESTADO ' || in_nome || ' FOI CADASTRADO COM SUCESSO!');
    COMMIT;
  
  EXCEPTION
      WHEN estado_cadastrado_exception THEN
        DBMS_OUTPUT.PUT_LINE ('O ESTADO ' || in_nome || ' JÁ ESTÁ CADASTRADO');
  
  END CAD_ESTADO;
  
  PROCEDURE CONS_ESTADO
  (
    in_sigla IN ESTADO.SIGLA%TYPE,
    out_nome OUT ESTADO.NOME%TYPE
  )
  IS
  BEGIN
    SELECT NOME INTO out_nome FROM ESTADO WHERE SIGLA = in_sigla;
  EXCEPTION
      WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE ('O ESTADO INFORMADO NÃO ESTÁ CADASTRADO');
  
  END CONS_ESTADO;
END NAC_ESTADOS;
/

alter procedure cad_estado compile;
alter package nac_estados compile;
alter package nac_estados compile body;

select object_name, object_type, status
from user_objects
where OBJECT_NAME in ('CAD_ESTADO', 'CONS_ESTADO', 'NAC_ESTADOS');

flashback table estado to before drop;

exec NAC_ESTADOS.CAD_ESTADO('Acre', 'AC')