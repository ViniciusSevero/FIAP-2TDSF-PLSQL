SET SERVEROUTPUT ON
SET VERIFY OFF
SET FEED OFF

ACCEPT pID_CD PROMPT 'ID_CD';
ACCEPT pQTD CHAR PROMPT 'QT_CD';

DECLARE
  v_ID_CD TAB_CD.ID_CD%TYPE := &pID_CD;
  v_QT_CD TAB_ESTOQUE.QTD_ESTOQUE %TYPE := &pQTD;
  
  e_invalid_tp_cd EXCEPTION;
  search_id_cd TAB_TP_CD.TP_CD%TYPE;
  registry TAB_CD%ROWTYPE;
BEGIN
  update TAB_ESTOQUE set QTD_ESTOQUE = v_QT_CD where ID_CD = v_ID_CD;
  
  if SQL%NOTFOUND then
    -- validar se o CD existe
    select * into registry from TAB_CD where ID_CD = v_ID_CD;
    insert into TAB_ESTOQUE values(v_ID_CD, v_QT_CD);
  end if;
  
  DBMS_OUTPUT.PUT_LINE('ok!');
  commit;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('CD ' || v_ID_CD  || ' não existe');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/