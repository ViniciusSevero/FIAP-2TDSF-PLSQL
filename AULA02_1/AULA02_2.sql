SELECT TO_CHAR(SYSDATE,'dd/mm/rrrr - hh.mi.ss') FROM DUAL;

DESC DUAL;
SELECT * FROM DUAL;

CREATE TABLE ALUNO_T
(COLL VARCHAR2(1));

INSERT INTO ALUNO_T VALUES('Z');
INSERT INTO ALUNO_T VALUES('T');
COMMIT;

SELECT SYSDATE FROM ALUNO_T;