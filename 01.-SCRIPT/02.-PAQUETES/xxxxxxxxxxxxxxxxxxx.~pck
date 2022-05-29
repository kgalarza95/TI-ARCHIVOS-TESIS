create or replace noneditionable package xxxxxxxxxxxxxxxxxxx is

  -- Author  : KEVIN GALARZA
  -- Created : 23/2/2022 0:00:40
  -- Purpose : PROCESOS DE INFRAESTRUCTURA
PROCEDURE PUB_CRUD_AREA(IV_OPCION        VARCHAR2,
                        IV_ID            VARCHAR2,     
                        IV_AREA          VARCHAR2,
                        IV_DEPARTAMENTO  VARCHAR2,
                        IV_NOMECLATURA   VARCHAR2,
                        --IV_ESTADO          VARCHAR2,
                        IV_USUARIO_SESION  VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2);

       
END xxxxxxxxxxxxxxxxxxx;
/
CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY xxxxxxxxxxxxxxxxxxx IS

PROCEDURE PUB_CRUD_AREA(IV_OPCION        VARCHAR2,
                        IV_ID            VARCHAR2,     
                        IV_AREA          VARCHAR2,
                        IV_DEPARTAMENTO  VARCHAR2,
                        IV_NOMECLATURA   VARCHAR2,
                        IV_USUARIO_SESION  VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    IF IV_OPCION = 'IN' THEN
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_APP_AREA A WHERE A.AREA = IV_AREA;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO '||IV_AREA;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_APP_AREA;
         
         INSERT INTO TI_APP_AREA(
           ID,
           AREA,
           DEPARTAMENTO,
           NOMECLATURA,
           FECHA_INGRESO,
           USUARIO_INGRESO,
           FECHA_MODIFICACION,
           USUARIO_MODIFICACION)
          VALUES(
           LN_INCREMENTAL,
           IV_AREA,
           IV_DEPARTAMENTO,
           IV_NOMECLATURA,
           SYSDATE,
           IV_USUARIO_SESION,
           SYSDATE,
           IV_USUARIO_SESION);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_AREA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_APP_AREA
          SET AREA                 =IV_AREA,
              DEPARTAMENTO         =IV_DEPARTAMENTO,
              NOMECLATURA          =IV_NOMECLATURA,
              ESTADO               ='S',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_AREA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_APP_AREA
          SET 
              ESTADO               ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_AREA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT A.ID, A.AREA, A.DEPARTAMENTO, NVL(A.NOMECLATURA, ' ') NOMECLATURA,
                A.ESTADO, A.FECHA_INGRESO, A.USUARIO_INGRESO, A.FECHA_MODIFICACION, A.USUARIO_MODIFICACION
         FROM TI_APP_AREA A;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_AREA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_AREA WHERE ID = IV_ID;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCIÓN NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   :='COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_AREA;



END xxxxxxxxxxxxxxxxxxx;
/
