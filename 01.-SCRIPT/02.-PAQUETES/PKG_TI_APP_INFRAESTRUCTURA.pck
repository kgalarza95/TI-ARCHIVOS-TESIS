create or replace noneditionable package PKG_TI_APP_INFRAESTRUCTURA is

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

PROCEDURE PUB_CRUD_CARGO(IV_OPCION          VARCHAR2,
                         IV_ID              VARCHAR2,     
                         IV_CARGO           VARCHAR2,
                         IV_STAR1           VARCHAR2,
                         IV_USUARIO_SESION  VARCHAR2,
                         OC_CONSULTA        OUT SYS_REFCURSOR,
                         OV_COD_RESPONSE    OUT VARCHAR2,
                         OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_TELEFONO(IV_OPCION          VARCHAR2,
                            IV_ID              VARCHAR2,     
                            IV_MARCA           VARCHAR2,
                            IV_MODELO          VARCHAR2,
                            IV_SERIE           VARCHAR2,
                            IV_EXTENSION       VARCHAR2,
                            IV_IP              VARCHAR2,
                            IV_USUARIO         VARCHAR2,
                            IV_CLAVE           VARCHAR2,
                            IV_DESCRIPCION     VARCHAR2,
                            IV_USUARIO_SESION  VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_COLABORADOR(IV_OPCION         VARCHAR2,
                              IV_ID              VARCHAR2,     
                              IV_ID_CARGO        VARCHAR2,
                              IV_ID_AREA         VARCHAR2,
                              IV_ID_TELEFONO     VARCHAR2,
                              IV_NOMBRES         VARCHAR2,
                              IV_APELLIDOS       VARCHAR2,
                              IV_DOMINIO         VARCHAR2,
                              IV_CORREO          VARCHAR2,
                              IV_AGENCIA         VARCHAR2,
                              IV_USUARIO_SESION  VARCHAR2,
                              OC_CONSULTA        OUT SYS_REFCURSOR,
                              OV_COD_RESPONSE    OUT VARCHAR2,    
                OV_MSJ_RESPONSE    OUT VARCHAR2);
                              
PROCEDURE PUB_CRUD_IP(IV_OPCION          VARCHAR2,
                      IV_ID              VARCHAR2,     
                      IV_SEGMENTO        VARCHAR2,
                      IV_IP              VARCHAR2,     
                      IV_USUARIO_SESION  VARCHAR2,
                      OC_CONSULTA        OUT SYS_REFCURSOR,
                      OV_COD_RESPONSE    OUT VARCHAR2,
                      OV_MSJ_RESPONSE    OUT VARCHAR2);
                      
PROCEDURE PUB_CRUD_HARDWARE(IV_OPCION          VARCHAR2,
                            IV_ID              VARCHAR2,     
                            IV_ID_COLABORADOR  VARCHAR2,
                            IV_DISPOSITIVO     VARCHAR2,
                            IV_MARCA           VARCHAR2,
                            IV_MODELO          VARCHAR2,
                            IV_SERIE           VARCHAR2,
                            IV_ADICIONAL       VARCHAR2,
                            
                            IV_CHK_INF_ADICIONAL VARCHAR2,
                            IV_IP                VARCHAR2,
                            IV_DOMINIO_HOST      VARCHAR2,
                            IV_CAPACIDAD_DD      VARCHAR2,
                            IV_TIPO_DD           VARCHAR2,
                            IV_RAM               VARCHAR2,
                            IV_SO                VARCHAR2,
                            IV_PROCESADOR        VARCHAR2,
                            IV_DESCRIPCION       VARCHAR2,
                            
                            IV_USUARIO_SESION    VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_MANTENIMIENTO(IV_OPCION         VARCHAR2,
                                 IV_ID             VARCHAR2,     
                                 IV_ID_OPERADOR    VARCHAR2,
                                 IV_ID_COLABORADOR VARCHAR2,
                                 IV_ID_HARDWARE    VARCHAR2,
                                 IV_ENCIENDE       VARCHAR2,
                                 IV_OBSERVACION_1  VARCHAR2,
                                 IV_PUERTOS        VARCHAR2,
                                 IV_OBSERVACION_2  VARCHAR2,
                                 IV_BOTONES        VARCHAR2,
                                 IV_OBSERVACION_3  VARCHAR2,
                                 IV_MONITOR        VARCHAR2,
                                 IV_OBSERVACION_4  VARCHAR2,
                                 IV_TECLADO        VARCHAR2,
                                 IV_OBSERVACION_5  VARCHAR2,
                                 IV_MOUSE          VARCHAR2,
                                 IV_OBSERVACION_6  VARCHAR2,
                                 IV_DURACION       VARCHAR2,
                                 IV_OBSERVACION_GEN VARCHAR2,
                                 IV_ADICIONAL       VARCHAR2,
                                 IV_USUARIO_SESION  VARCHAR2,
                                 OC_CONSULTA        OUT SYS_REFCURSOR,
                                 OV_COD_RESPONSE    OUT VARCHAR2,
                                 OV_MSJ_RESPONSE    OUT VARCHAR2);                                                                                                    

PROCEDURE PUB_CRUD_CALIFICACION(IV_OPCION           VARCHAR2,
                                IV_ID               VARCHAR2,  
                                IV_ID_MANTENIMIENTO VARCHAR2,   
                                IV_CALIFICACION     VARCHAR2, 
                                IV_OBSERVACION      VARCHAR2, 
                                IV_USUARIO_SESION   VARCHAR2,
                                OC_CONSULTA         OUT SYS_REFCURSOR,
                                OV_COD_RESPONSE     OUT VARCHAR2,
                                OV_MSJ_RESPONSE     OUT VARCHAR2);
                                
PROCEDURE PUB_GET_PARAM_CMB(IV_OPCION        VARCHAR2,
                            IV_CRITERIO      VARCHAR2,
                            OC_CONSULTA      OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE  OUT VARCHAR2,
                            OV_MSJ_RESPONSE  OUT VARCHAR2);
              
END PKG_TI_APP_INFRAESTRUCTURA;
/
CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY PKG_TI_APP_INFRAESTRUCTURA IS

PROCEDURE PUB_CRUD_AREA(IV_OPCION        VARCHAR2,
                        IV_ID            VARCHAR2,     
                        IV_AREA          VARCHAR2,
                        IV_DEPARTAMENTO  VARCHAR2,
                        IV_NOMECLATURA   VARCHAR2,
                        --IV_ESTADO          VARCHAR2,
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

PROCEDURE PUB_CRUD_CARGO(IV_OPCION          VARCHAR2,
                         IV_ID              VARCHAR2,     
                         IV_CARGO           VARCHAR2,
                         IV_STAR1           VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_APP_CARGO A WHERE A.ID = IV_ID;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO ';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_APP_CARGO;
         
         INSERT INTO TI_APP_CARGO(
             ID,
             CARGO,
             STAR1,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES(
             LN_INCREMENTAL,
             IV_CARGO,
             IV_STAR1,
             IV_USUARIO_SESION,
             IV_USUARIO_SESION);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_CARGO A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_CARGO
           SET CARGO 	 =   IV_CARGO,
               STAR1 	 =   IV_STAR1,
               ESTADO 	 =   'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_CARGO A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_APP_CARGO
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
       FROM TI_APP_CARGO;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT ID, ESTADO, FECHA_MODIFICACION, USUARIO_MODIFICACION,
               NVL(CARGO, ' ') AS CARGO,
               NVL(STAR1, ' ') AS STAR1 FROM TI_APP_CARGO A;
               
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_CARGO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_CARGO WHERE ID = IV_ID;
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
END PUB_CRUD_CARGO;

PROCEDURE PUB_CRUD_TELEFONO(IV_OPCION          VARCHAR2,
                            IV_ID              VARCHAR2,     
                            IV_MARCA           VARCHAR2,
                            IV_MODELO          VARCHAR2,
                            IV_SERIE           VARCHAR2,
                            IV_EXTENSION       VARCHAR2,
                            IV_IP              VARCHAR2,
                            IV_USUARIO         VARCHAR2,
                            IV_CLAVE           VARCHAR2,
                            IV_DESCRIPCION     VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_APP_TELEFONO A WHERE A.SERIE = IV_SERIE;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON SERIE '||IV_SERIE;
       ELSE
         --VALIDAR QUE LA IP YA ESTÉ ASIGNADA
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_APP_TELEFONO;
         
         INSERT INTO TI_APP_TELEFONO(
             ID,
             MARCA,
             MODELO,
             SERIE,
             EXTENSION,
             IP,
             USUARIO,
             CLAVE,
             DESCRIPCION,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES(
             LN_INCREMENTAL,
             IV_MARCA,
             IV_MODELO,
             IV_SERIE,
             IV_EXTENSION,
             IV_IP,--ESTE DEBE SER ID DE IP
             IV_USUARIO,
             IV_CLAVE,
             IV_DESCRIPCION,
             IV_USUARIO_SESION,
             IV_USUARIO_SESION);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_TELEFONO A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_TELEFONO
           SET MARCA       = IV_MARCA,
               MODELO      = IV_MODELO,
               SERIE       = IV_SERIE,
               EXTENSION   = IV_EXTENSION,
               IP          = IV_IP,
               USUARIO     = IV_USUARIO,
               CLAVE       = IV_CLAVE,
               DESCRIPCION = IV_DESCRIPCION,
               ESTADO 	   =   'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_TELEFONO A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_APP_TELEFONO
          SET ESTADO               ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_TELEFONO;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT A.ID, A.ESTADO, A.FECHA_MODIFICACION, A.USUARIO_MODIFICACION,
                NVL(MARCA, ' ') AS MARCA,
                NVL(MODELO, ' ') AS MODELO,
                NVL(SERIE, ' ') SERIE,
                NVL(EXTENSION, ' ') EXTENSION,
                NVL(A.IP, ' ') IP,
                NVL(I.IP, ' ') IP_VAL,
                NVL(USUARIO, ' ') AS USUARIO,
                NVL(CLAVE, ' ') AS CLAVE,
                NVL(DESCRIPCION, ' ') AS DESCRIPCION
               FROM TI_APP_TELEFONO A
               JOIN TI_APP_IP I ON I.ID = A.IP;
               
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_TELEFONO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_TELEFONO WHERE ID = IV_ID;
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
END PUB_CRUD_TELEFONO;

PROCEDURE PUB_CRUD_COLABORADOR(IV_OPCION         VARCHAR2,
                              IV_ID              VARCHAR2,     
                              IV_ID_CARGO        VARCHAR2,
                              IV_ID_AREA         VARCHAR2,
                              IV_ID_TELEFONO     VARCHAR2,
                              IV_NOMBRES         VARCHAR2,
                              IV_APELLIDOS       VARCHAR2,
                              IV_DOMINIO         VARCHAR2,
                              IV_CORREO          VARCHAR2,
                              IV_AGENCIA         VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_APP_COLABORADOR A WHERE A.ID = IV_ID;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO ';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_APP_COLABORADOR;
         
         INSERT INTO TI_APP_COLABORADOR(
             ID,
             ID_CARGO,
             ID_A_DEPARTAMENTO,
             ID_TELEFONO,
             NOMBRES,
             APELLIDOS,
             DOMINIO,
             CORREO,
             AGENCIA,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES(
             LN_INCREMENTAL,
             IV_ID_CARGO,
             IV_ID_AREA,
             IV_ID_TELEFONO,
             IV_NOMBRES,
             IV_APELLIDOS,
             IV_DOMINIO,
             IV_CORREO,
             IV_AGENCIA,
             IV_USUARIO_SESION,
             IV_USUARIO_SESION);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_COLABORADOR A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_COLABORADOR
           SET ID_CARGO     = IV_ID_CARGO,
               ID_A_DEPARTAMENTO      = IV_ID_AREA,
               ID_TELEFONO  = IV_ID_TELEFONO,
               NOMBRES      = IV_NOMBRES,
               APELLIDOS    = IV_APELLIDOS,
               DOMINIO      = IV_DOMINIO,
               CORREO       = IV_CORREO,
               AGENCIA      = IV_AGENCIA,
               ESTADO 	    = 'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_COLABORADOR A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_COLABORADOR
          SET ESTADO               ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_COLABORADOR;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT ID, ESTADO, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                NVL(ID_CARGO, '0') AS ID_CARGO,
                NVL(ID_A_DEPARTAMENTO, '0') AS ID_AREA,
                NVL(ID_TELEFONO, '0') ID_TELEFONO,
                NVL(NOMBRES, ' ') NOMBRES,
                NVL(APELLIDOS, ' ') APELLIDOS,
                NVL(DOMINIO, ' ') AS DOMINIO,
                NVL(CORREO, ' ') AS CORREO,
                NVL(AGENCIA, '0') AS AGENCIA
          FROM TI_APP_COLABORADOR A;
               
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_COLABORADOR WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_COLABORADOR WHERE ID = IV_ID;
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
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_COLABORADOR;

PROCEDURE PUB_CRUD_IP(IV_OPCION          VARCHAR2,
                      IV_ID              VARCHAR2,     
                      IV_SEGMENTO        VARCHAR2,
                      IV_IP              VARCHAR2,     
                      IV_USUARIO_SESION  VARCHAR2,
                      OC_CONSULTA        OUT SYS_REFCURSOR,
                      OV_COD_RESPONSE    OUT VARCHAR2,
                      OV_MSJ_RESPONSE    OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
 LV_MASK_I VARCHAR2(9) := '192.168.';

BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    IF IV_OPCION = 'IN' THEN
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_APP_IP A WHERE A.SEGMENTO = IV_SEGMENTO;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO ';
       ELSE
         FOR I IN 1..255 LOOP
             SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
             FROM TI_APP_IP;
             
             INSERT INTO TI_APP_IP(
                 ID,
                 SEGMENTO,
                 IP,
                 USUARIO_INGRESO,
                 USUARIO_MODIFICACION)
              VALUES(
                 LN_INCREMENTAL,
                 IV_SEGMENTO,
                 LV_MASK_I||IV_SEGMENTO||'.'||I,--IV_IP,
                 IV_USUARIO_SESION,
                 IV_USUARIO_SESION);
               COMMIT;
             OV_COD_RESPONSE := '00';
             OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
         END LOOP;
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_IP A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_IP
           SET SEGMENTO     = IV_SEGMENTO,
               IP           = IV_IP,
               ESTADO 	    = 'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_IP A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_IP
          SET ESTADO               ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_IP;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT ID, ESTADO, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                NVL(SEGMENTO, ' ') AS SEGMENTO,
                NVL(IP, ' ') AS IP
          FROM TI_APP_IP A
          WHERE A.SEGMENTO = IV_SEGMENTO;
               
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_IP 
       WHERE SEGMENTO = IV_SEGMENTO;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT ID, ESTADO, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                NVL(SEGMENTO, ' ') AS SEGMENTO,
                NVL(IP, ' ') AS IP 
         FROM TI_APP_IP WHERE SEGMENTO = IV_SEGMENTO
         ORDER BY ID;
         
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
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_IP;

--VER MANT DE HARDWARE
PROCEDURE PUB_CRUD_HARDWARE(IV_OPCION          VARCHAR2,
                            IV_ID              VARCHAR2,     
                            IV_ID_COLABORADOR  VARCHAR2,
                            IV_DISPOSITIVO     VARCHAR2,
                            IV_MARCA           VARCHAR2,
                            IV_MODELO          VARCHAR2,
                            IV_SERIE           VARCHAR2,
                            IV_ADICIONAL       VARCHAR2,
                            
                            IV_CHK_INF_ADICIONAL VARCHAR2,
                            IV_IP                VARCHAR2,
                            IV_DOMINIO_HOST      VARCHAR2,
                            IV_CAPACIDAD_DD      VARCHAR2,
                            IV_TIPO_DD           VARCHAR2,
                            IV_RAM               VARCHAR2,
                            IV_SO                VARCHAR2,
                            IV_PROCESADOR        VARCHAR2,
                            IV_DESCRIPCION       VARCHAR2,
                            
                            IV_USUARIO_SESION    VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2)

AS
 LN_INCREMENTAL NUMBER;
 LN_ID_HARDWARE NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    IF IV_OPCION = 'IN' THEN
    /*  
     SELECT COUNT(1) INTO LN_EXISTE 
     FROM TI_APP_HARDWAR A WHERE A.ID = IV_ID;--??*/
      
     LN_EXISTE := 0;
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO ';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_ID_HARDWARE
         FROM TI_APP_HARDWAR;
         
         INSERT INTO TI_APP_HARDWAR(
             ID,
             ID_COLABORADOR,
             DISPOSITIVO,
             MARCA,
             MODELO,
             SERIE,
             ADICIONAL,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES(
             LN_ID_HARDWARE,
             IV_ID_COLABORADOR,
             IV_DISPOSITIVO,
             IV_MARCA,
             IV_MODELO,
             IV_SERIE,
             IV_ADICIONAL,
             IV_USUARIO_SESION,
             IV_USUARIO_SESION);
             
           --INSERT DE CARACTERISTICAS EN CASO DE PC
           IF IV_CHK_INF_ADICIONAL = 'S' THEN
             
             SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
             FROM TI_APP_CARACTERISTICAS;
             
             INSERT INTO TI_APP_CARACTERISTICAS
                (ID,
                 ID_HARDWAR,
                 IP,
                 DOMINIO_HOST,
                 CAPACIDAD_DD,
                 TIPO_DD,
                 RAM,
                 SO,
                 PROCESADOR,
                 DESCRIPCION,
                 USUARIO_INGRESO,
                 USUARIO_MODIFICACION)
              VALUES
                (LN_INCREMENTAL,
                 LN_ID_HARDWARE,
                 IV_IP,
                 IV_DOMINIO_HOST,
                 IV_CAPACIDAD_DD,
                 IV_TIPO_DD,
                 IV_RAM,
                 IV_SO,
                 IV_PROCESADOR,
                 IV_DESCRIPCION,
                 IV_USUARIO_SESION,
                 IV_USUARIO_SESION);
           END IF;
           
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_HARDWAR A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_HARDWAR
           SET ID_COLABORADOR = IV_ID_COLABORADOR,
               DISPOSITIVO    = IV_DISPOSITIVO,
               MARCA          = IV_MARCA,
               MODELO         = IV_MODELO,
               SERIE          = IV_SERIE,
               ADICIONAL      = IV_ADICIONAL,
               ESTADO 	      = 'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         --UPDATE DE CARACTERISTICAS EN CASO DE PC
         IF IV_CHK_INF_ADICIONAL = 'S' THEN
             
             SELECT COUNT(1) INTO LN_EXISTE
             FROM TI_APP_CARACTERISTICAS
             WHERE ID_HARDWAR = IV_ID;
             
             IF LN_EXISTE > 0 THEN
                
                 UPDATE TI_APP_CARACTERISTICAS
                   SET IP = IV_IP,
                       DOMINIO_HOST = IV_DOMINIO_HOST,
                       CAPACIDAD_DD = IV_CAPACIDAD_DD,
                       TIPO_DD = IV_TIPO_DD,
                       RAM = IV_RAM,
                       SO = IV_SO,
                       PROCESADOR = IV_PROCESADOR,
                       DESCRIPCION = IV_DESCRIPCION,
                       ESTADO = 'S',
                       FECHA_MODIFICACION = SYSDATE,
                       USUARIO_MODIFICACION = IV_USUARIO_SESION
                 WHERE ID_HARDWAR = IV_ID;
             ELSE
                 SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
                 FROM TI_APP_CARACTERISTICAS;
                 
                 INSERT INTO TI_APP_CARACTERISTICAS
                    (ID,
                     ID_HARDWAR,
                     IP,
                     DOMINIO_HOST,
                     CAPACIDAD_DD,
                     TIPO_DD,
                     RAM,
                     SO,
                     PROCESADOR,
                     DESCRIPCION,
                     USUARIO_INGRESO,
                     USUARIO_MODIFICACION)
                  VALUES
                    (LN_INCREMENTAL,
                     IV_ID,
                     IV_IP,
                     IV_DOMINIO_HOST,
                     IV_CAPACIDAD_DD,
                     IV_TIPO_DD,
                     IV_RAM,
                     IV_SO,
                     IV_PROCESADOR,
                     IV_DESCRIPCION,
                     IV_USUARIO_SESION,
                     IV_USUARIO_SESION);
             END IF;
             --SI EXITE UPDATE Y SI NO, INSERTAR
         END IF;
         
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_HARDWAR A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_HARDWAR
          SET ESTADO               = 'N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
          
          IF IV_CHK_INF_ADICIONAL = 'S' THEN
             UPDATE TI_APP_CARACTERISTICAS
               SET ESTADO = 'N',
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_SESION
             WHERE ID_HARDWAR = IV_ID;
          END IF;
         
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_HARDWAR;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT A.ID, A.ESTADO, A.FECHA_MODIFICACION, A.USUARIO_MODIFICACION,
                A.ID_COLABORADOR,
                NVL(U.DOMINIO, ' ') DOMINIO, 
                NVL(A.DISPOSITIVO, ' ') AS DISPOSITIVO,
                NVL(A.MARCA, ' ') AS MARCA,
                NVL(A.MODELO, ' ') AS MODELO,
                NVL(A.SERIE, ' ') AS SERIE,
                NVL(A.ADICIONAL, ' ') AS ADICIONAL,
               (CASE WHEN LENGTH(C.ID) > 0 THEN 'S'
                     ELSE 'N' END) INF_ADICIONAL,
                NVL(C.IP, 0) ID_IP,
                NVL(I.IP, 0) IP,
                NVL(DOMINIO_HOST, ' ') DOMINIO_HOST,
                NVL(CAPACIDAD_DD, 0) CAPACIDAD_DD,
                NVL(TIPO_DD, ' ') TIPO_DD,
                NVL(RAM, ' ') RAM,
                NVL(SO, ' ') SO,
                NVL(PROCESADOR, ' ') PROCESADOR,
                NVL(DESCRIPCION, ' ') DESCRIPCION
          FROM TI_APP_HARDWAR A
          LEFT JOIN TI_APP_CARACTERISTICAS C ON C.ID_HARDWAR = A.ID
          LEFT JOIN TI_APP_IP I ON I.ID = C.IP
          LEFT JOIN ti_app_colaborador U ON U.ID = A.ID_COLABORADOR;
         
         --SELECT DE CARACTERISTICAS EN CASO DE PC 
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_HARDWAR WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_HARDWAR WHERE ID = IV_ID;
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
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_HARDWARE;

PROCEDURE PUB_CRUD_MANTENIMIENTO(IV_OPCION         VARCHAR2,
                                 IV_ID             VARCHAR2,     
                                 IV_ID_OPERADOR    VARCHAR2,
                                 IV_ID_COLABORADOR VARCHAR2,
                                 IV_ID_HARDWARE    VARCHAR2,
                                 IV_ENCIENDE       VARCHAR2,
                                 IV_OBSERVACION_1  VARCHAR2,
                                 IV_PUERTOS        VARCHAR2,
                                 IV_OBSERVACION_2  VARCHAR2,
                                 IV_BOTONES        VARCHAR2,
                                 IV_OBSERVACION_3  VARCHAR2,
                                 IV_MONITOR        VARCHAR2,
                                 IV_OBSERVACION_4  VARCHAR2,
                                 IV_TECLADO        VARCHAR2,
                                 IV_OBSERVACION_5  VARCHAR2,
                                 IV_MOUSE          VARCHAR2,
                                 IV_OBSERVACION_6  VARCHAR2,
                                 IV_DURACION       VARCHAR2,
                                 IV_OBSERVACION_GEN VARCHAR2,
                                 IV_ADICIONAL       VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_APP_MANTENIMIENTO A WHERE A.ID = IV_ID;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO ';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_APP_HARDWAR;
         
         INSERT INTO TI_APP_MANTENIMIENTO(
             ID,
             ID_OPERADOR, -->
             ID_COLABORADOR,
             ID_HARDWARE,
             ENCIENDE,
             OBSERVACION_1,
             PUERTOS,
             OBSERVACION_2,
             BOTONES,
             OBSERVACION_3,
             MONITOR,
             OBSERVACION_4,
             TECLADO,
             OBSERVACION_5,
             MOUSE,
             OBSERVACION_6,
             DURACION,
             OBSERVACION_GEN,
             ADICIONAL,    -->
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES(
             LN_INCREMENTAL,
             IV_ID_OPERADOR,-->
             IV_ID_COLABORADOR,
             IV_ID_HARDWARE,
             IV_ENCIENDE,
             IV_OBSERVACION_1,
             IV_PUERTOS,
             IV_OBSERVACION_2,
             IV_BOTONES,
             IV_OBSERVACION_3,
             IV_MONITOR,
             IV_OBSERVACION_4,
             IV_TECLADO,
             IV_OBSERVACION_5,
             IV_MOUSE,
             IV_OBSERVACION_6,
             IV_DURACION,
             IV_OBSERVACION_GEN,
             IV_ADICIONAL,--->
             IV_USUARIO_SESION,
             IV_USUARIO_SESION);
           --INSERT DE CARACTERISTICAS EN CASO DE PC
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_MANTENIMIENTO A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_MANTENIMIENTO
           SET ID_OPERADOR     = IV_ID_OPERADOR,
               ID_COLABORADOR  = IV_ID_COLABORADOR,
               ID_HARDWARE     = IV_ID_HARDWARE,
               ENCIENDE        = IV_ENCIENDE,
               OBSERVACION_1   = IV_OBSERVACION_1,
               PUERTOS         = IV_PUERTOS,
               OBSERVACION_2   = IV_OBSERVACION_2,
               BOTONES         = IV_BOTONES,
               OBSERVACION_3   = IV_OBSERVACION_3,
               MONITOR         = IV_MONITOR,
               OBSERVACION_4   = IV_OBSERVACION_4,
               TECLADO         = IV_TECLADO,
               OBSERVACION_5   = IV_OBSERVACION_5,
               MOUSE           = IV_MOUSE,
               OBSERVACION_6   = IV_OBSERVACION_6,
               DURACION        = IV_DURACION,
               OBSERVACION_GEN = IV_OBSERVACION_GEN,
               ADICIONAL       = IV_ADICIONAL,
               ESTADO 	       = 'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         --UPDATE DE CARACTERISTICAS EN CASO DE PC
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_MANTENIMIENTO A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_MANTENIMIENTO
          SET ESTADO               = 'N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_MANTENIMIENTO;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT ID, ESTADO, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                ID_OPERADOR,
                ID_COLABORADOR,
                ID_HARDWARE,
                NVL(ENCIENDE, ' ') AS ENCIENDE,
                NVL(OBSERVACION_1, ' ') AS OBSERVACION_1,
                NVL(PUERTOS, ' ') AS PUERTOS,
                NVL(OBSERVACION_2, ' ') AS OBSERVACION_2,
                NVL(BOTONES, ' ') AS BOTONES,
                NVL(OBSERVACION_3, ' ') AS OBSERVACION_3,
                NVL(MONITOR, ' ') AS MONITOR,
                NVL(OBSERVACION_4, ' ') AS OBSERVACION_4,
                NVL(TECLADO, ' ') AS TECLADO,
                NVL(OBSERVACION_5, ' ') AS OBSERVACION_5,
                NVL(MOUSE, ' ') AS MOUSE,
                NVL(OBSERVACION_6, ' ') AS OBSERVACION_6,
                NVL(DURACION, ' ') AS DURACION,
                NVL(OBSERVACION_GEN, ' ') AS OBSERVACION_GEN,
                NVL(ADICIONAL, ' ') AS ADICIONAL
          FROM TI_APP_MANTENIMIENTO A;
         
         --SELECT DE CARACTERISTICAS EN CASO DE PC 
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_MANTENIMIENTO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_MANTENIMIENTO WHERE ID = IV_ID;
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
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_MANTENIMIENTO;

PROCEDURE PUB_CRUD_CALIFICACION(IV_OPCION           VARCHAR2,
                                IV_ID               VARCHAR2,  
                                IV_ID_MANTENIMIENTO VARCHAR2,   
                                IV_CALIFICACION     VARCHAR2, 
                                IV_OBSERVACION      VARCHAR2, 
                                IV_USUARIO_SESION   VARCHAR2,
                                OC_CONSULTA         OUT SYS_REFCURSOR,
                                OV_COD_RESPONSE     OUT VARCHAR2,
                                OV_MSJ_RESPONSE     OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    IF IV_OPCION = 'IN' THEN
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_APP_CALIFICACION A WHERE A.ID = IV_ID;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO ';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_APP_CALIFICACION;
         
         INSERT INTO TI_APP_CALIFICACION(
             ID,
             ID_MANTENIMIENTO,
             CALIFICACION,
             OBSERVACION,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES(
             LN_INCREMENTAL,
             IV_ID_MANTENIMIENTO,
             IV_CALIFICACION,
             IV_OBSERVACION,
             IV_USUARIO_SESION,
             IV_USUARIO_SESION);
           --INSERT DE CARACTERISTICAS EN CASO DE PC
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
      FROM TI_APP_CALIFICACION A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_CALIFICACION
           SET ID_MANTENIMIENTO  = IV_ID_MANTENIMIENTO,
               CALIFICACION      = IV_CALIFICACION,
               OBSERVACION       = IV_OBSERVACION,
               ESTADO 	         = 'S',
               FECHA_MODIFICACION   = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_SESION
         WHERE ID = IV_ID;
         
         --UPDATE DE CARACTERISTICAS EN CASO DE PC
         COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_CALIFICACION A WHERE A.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE TI_APP_CALIFICACION
          SET ESTADO               = 'N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IV_ID;
          
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_CALIFICACION;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT ID, ESTADO, FECHA_MODIFICACION, USUARIO_MODIFICACION,
                NVL(CALIFICACION, ' ') AS CALIFICACION,
                NVL(OBSERVACION, ' ') AS OBSERVACION
          FROM TI_APP_CALIFICACION A;
         
         --SELECT DE CARACTERISTICAS EN CASO DE PC 
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_CALIFICACION WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_APP_CALIFICACION WHERE ID = IV_ID;
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
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_CALIFICACION;

PROCEDURE PUB_GET_PARAM_CMB(IV_OPCION        VARCHAR2,
                            IV_CRITERIO      VARCHAR2,
                            OC_CONSULTA      OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE  OUT VARCHAR2,
                            OV_MSJ_RESPONSE  OUT VARCHAR2)
AS
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    --CA | CT | CS | CI | CD | CC | CO | CE | CH | CU
    --SO
    IF IV_OPCION = 'CA' THEN --CMB AREA
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_AREA A;
       LN_EXISTE := 1;
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT 'NEW' CLAVE, 'NUEVA AREA' AS VALOR FROM DUAL
         UNION ALL
         SELECT DISTINCT A.AREA CLAVE, A.AREA VALOR
         FROM TI_APP_AREA A;

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF; 
    ELSIF IV_OPCION = 'CT' THEN --CMB MARCA TELEFONO
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_TELEFONO T WHERE T.ESTADO = 'S';
       LN_EXISTE := 1;
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT 'NEW' CLAVE, 'NUEVA MARCA' AS VALOR FROM DUAL
         UNION ALL
         SELECT DISTINCT T.MARCA CLAVE, T.MARCA VALOR FROM TI_APP_TELEFONO T
         WHERE T.ESTADO = 'S';

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;   
    ELSIF IV_OPCION = 'CS' THEN --CMB SEGMENTO
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_IP T;
       LN_EXISTE := 1;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         --SELECT 'NEW' CLAVE, 'NUEVO SEGMENTO' AS VALOR FROM DUAL
         --UNION ALL
         SELECT DISTINCT I.SEGMENTO CLAVE, I.SEGMENTO VALOR FROM TI_APP_IP I
         ORDER BY SEGMENTO;

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;     
    ELSIF IV_OPCION = 'CI' THEN --CMB IPS X SEGMENTO
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_IP I
       LEFT JOIN TI_APP_TELEFONO T ON T.IP = I.ID 
       LEFT JOIN TI_APP_CARACTERISTICAS C ON C.IP = I.ID 
       WHERE T.IP IS NULL AND C.IP IS NULL
       AND I.SEGMENTO = IV_CRITERIO;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         --AQUI HAY QUE VALIDAR QU SOLO SE MUESTREN LAS QUE
         --NO HAN SIDO ASIGNADAS
         OPEN OC_CONSULTA FOR 
        /* SELECT 'NEW' CLAVE, 'NUEVA IP' AS VALOR FROM DUAL
         UNION ALL*/
         SELECT I.ID CLAVE, I.IP VALOR 
         FROM TI_APP_IP I
         LEFT JOIN TI_APP_TELEFONO T ON T.IP = I.ID 
         LEFT JOIN TI_APP_CARACTERISTICAS C ON C.IP = I.ID 
         WHERE T.IP IS NULL AND C.IP IS NULL
         AND I.SEGMENTO = IV_CRITERIO
         ORDER BY I.ID;

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;  
    ELSIF IV_OPCION = 'CD' THEN --CMB DEPARTAMENTOS
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_AREA A
       WHERE A.DEPARTAMENTO IN (SELECT DISTINCT B.DEPARTAMENTO FROM TI_APP_AREA B WHERE B.ESTADO = 'S');
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT A.ID AS CLAVE, A.DEPARTAMENTO AS VALOR
         FROM TI_APP_AREA A
         WHERE A.DEPARTAMENTO IN (SELECT DISTINCT B.DEPARTAMENTO FROM TI_APP_AREA B
                                  WHERE B.ESTADO = 'S');

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;   
    ELSIF IV_OPCION = 'CC' THEN --CMB CARGO
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_CARGO A
       WHERE A.ESTADO = 'S';
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT A.ID AS CLAVE, A.CARGO AS VALOR
         FROM TI_APP_CARGO A
         WHERE A.ESTADO = 'S';

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF; 
    ELSIF IV_OPCION = 'CO' THEN --CMB OFICINA AGENCIA
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA A
       WHERE A.ESTADO = 'S';
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT A.CODIGO_AGENCIA AS CLAVE, A.NOMBRE_AGENCIA AS VALOR
         FROM TI_SEG_AGENCIA A
         WHERE A.ESTADO = 'S';

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF; 
    ELSIF IV_OPCION = 'CH' THEN --CMB HARDWARE DISPOSITIVO
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_HARDWAR A;
       LN_EXISTE := 1;
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT 'NEW' AS CLAVE, 'NUEVO DISPOSITIVO' AS VALOR FROM DUAL
         UNION ALL
         SELECT DISTINCT A.DISPOSITIVO AS CLAVE, A.DISPOSITIVO AS VALOR
         FROM TI_APP_HARDWAR A;

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF; 
    ELSIF IV_OPCION = 'CE' THEN --CMB EXTENSION TELEFONO
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_TELEFONO A
       WHERE A.ESTADO = 'S';
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT 0 AS CLAVE, 'NINGUNO' AS VALOR FROM DUAL
         UNION ALL
         SELECT A.ID AS CLAVE, A.EXTENSION AS VALOR
         FROM TI_APP_TELEFONO A
         WHERE A.ESTADO = 'S';

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF; 
    ELSIF IV_OPCION = 'CU' THEN --CMB USUARIO COLABORADOR
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_APP_COLABORADOR A
       WHERE A.ESTADO = 'S';
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR 
         SELECT 0 AS CLAVE, 'NINGUNO' AS VALOR FROM DUAL
         UNION ALL
         SELECT A.ID AS CLAVE, A.APELLIDOS||' '||A.NOMBRES AS VALOR
         FROM TI_APP_COLABORADOR A
         WHERE A.ESTADO = 'S';

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF; 
    
    ELSIF IV_OPCION = 'SO' THEN --CMB SISTEMA OPERATIVO
         OPEN OC_CONSULTA FOR 
         SELECT 'NEW' CLAVE, 'NUEVO SO' AS VALOR FROM DUAL
         UNION ALL
         SELECT DISTINCT T.SO CLAVE, T.SO VALOR
         FROM TI_APP_CARACTERISTICAS T;

         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCIÓN NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_GET_PARAM_CMB;


END PKG_TI_APP_INFRAESTRUCTURA;
/
