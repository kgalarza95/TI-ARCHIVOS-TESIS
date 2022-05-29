CREATE OR REPLACE NONEDITIONABLE PACKAGE PKG_TI_SEG_TRX_ADMINISTRADOR IS

  -- AUTHOR  : KEVINGALARZA
  -- CREATED : 23/1/2022 0:25:41
  -- PURPOSE : PROCESOS DE AMBIENTE DE ADMINISTRACION
  
PROCEDURE PUB_CRUD_TEMPLATE(IV_OPCION        VARCHAR2,
                            IN_ID              NUMBER, 
                    OC_CONSULTA      OUT SYS_REFCURSOR,
                    OV_COD_RESPONSE  OUT VARCHAR2,
                    OV_MSJ_RESPONSE  OUT VARCHAR2);

PROCEDURE PUB_CRUD_EMPRESA(IV_OPCION          VARCHAR2,
                           IN_ID              NUMBER,    
                           IV_NOMBRE          VARCHAR2,
                           IV_RUC             VARCHAR2,
                           IV_DIRECCION       VARCHAR2,
                           IV_TELEFONO        VARCHAR2,
                           IV_ESTADO          VARCHAR2,
                           IV_USUARIO_SESION  VARCHAR2,                          
                           OC_CONSULTA        OUT SYS_REFCURSOR,
                           OV_COD_RESPONSE    OUT VARCHAR2,
                           OV_MSJ_RESPONSE    OUT VARCHAR2);
PROCEDURE PUB_CRUD_AGENCIA(IV_OPCION          VARCHAR2,
                           IN_ID              VARCHAR2,     
                           IN_ID_EMPRESA      VARCHAR2,
                           IV_CODIGO_AGENCIA  VARCHAR2,
                           IV_NOMBRE_AGENCIA  VARCHAR2,
                           IV_DESCRIPCION     VARCHAR2,
                           IV_COD_HOMOLOGADO  VARCHAR2,
                           IV_ESTADO          VARCHAR2,
                           IV_USUARIO_SESION  VARCHAR2,
                           
                           OC_CONSULTA        OUT SYS_REFCURSOR,
                           OV_COD_RESPONSE    OUT VARCHAR2,
                           OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_RT_PRUEBA(IV_ENTRADA VARCHAR2,
                        IV_APE VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_GET_LOGIN(IV_USUARIO          VARCHAR2,
                        IV_CONTRASENIA      VARCHAR2, 
                        IV_ACT_DIRECT       VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2);  
                         
PROCEDURE PUB_CRUD_PERSONA( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_TIPO_IDENTIFICACION VARCHAR2,
                            IV_ID_TIPO_SEXO VARCHAR2,
                            IV_NUM_IDENTIFICACION VARCHAR2,
                            IV_PRIMER_NOMBRE VARCHAR2,
                            IV_SEGUNDO_NOMBRE VARCHAR2,
                            IV_PRIMER_APELLIDO VARCHAR2,
                            IV_SEGUNDO_APELLIDO VARCHAR2,
                            IV_FECHA_NACIMIENTO VARCHAR2,
                            IV_DIRECCION_DOMICILIO VARCHAR2,
                            IV_DIRECCION_TRABAJO VARCHAR2,
                            IV_TELEFONO_DOMICILIO VARCHAR2,
                            IV_TELEFONO_TRABAJO VARCHAR2,
                            IV_OBSERVACION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
                           OC_CONSULTA        OUT SYS_REFCURSOR,
                           OV_COD_RESPONSE    OUT VARCHAR2,
                           OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_USUARIO( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_PERSONA VARCHAR2,
                            IV_ID_AGENCIA VARCHAR2,
                            IV_NOM_USUARIO VARCHAR2,
                            IV_CLAVE_ACTUAL VARCHAR2,
                            IV_INTENTOS_FALLIDOS VARCHAR2,
                            IV_ESTADO_BLOQUEO VARCHAR2,
                            IV_FECHA_EXPIRA_CLAVE VARCHAR2,
                            IV_USUARIO_HOMOLOGACION VARCHAR2,
                            IV_OBSERVACION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
                           OC_CONSULTA        OUT SYS_REFCURSOR,
                           OV_COD_RESPONSE    OUT VARCHAR2,
                           OV_MSJ_RESPONSE    OUT VARCHAR2);
 
PROCEDURE PUB_CRUD_MENU( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_NOMBRE VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_SUBMENU( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_MENU VARCHAR2,
                            IV_NOMBRE VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2);                                                                                             

PROCEDURE PUB_CRUD_OPCIONES( IV_OPCION          VARCHAR2,
                            IV_ID               VARCHAR2,
                            IV_ID_SUBMENU       VARCHAR2,
                            IV_NOMBRE           VARCHAR2,
                            IV_URL              VARCHAR2,
                            IV_DESCRIPCION      VARCHAR2,
                            IV_ESTADO           VARCHAR2,
                            IV_USUARIO_TRX      VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_ROL( IV_OPCION          VARCHAR2,
                            IV_ID          VARCHAR2,
                            IV_NOMBRE      VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO      VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
                           OC_CONSULTA        OUT SYS_REFCURSOR,
                           OV_COD_RESPONSE    OUT VARCHAR2,
                           OV_MSJ_RESPONSE    OUT VARCHAR2);                           

PROCEDURE PUB_CRUD_ROL_X_USUARIO( IV_OPCION          VARCHAR2,
                                  IV_ID          VARCHAR2,
                                  IV_ID_ROL      VARCHAR2,
                                  IV_ID_USUARIO  VARCHAR2,
                                  IV_ES_PRINCIPAL VARCHAR2,
                                  IV_ESTADO       VARCHAR2,
                                  IV_USUARIO_TRX  VARCHAR2,
                                  OC_CONSULTA        OUT SYS_REFCURSOR,
                                  OV_COD_RESPONSE    OUT VARCHAR2,
                                  OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_OPC_X_ROL( IV_OPCION          VARCHAR2,
                                  IV_ID          VARCHAR2,
                                  IV_ID_ROL      VARCHAR2,
                                  IV_ID_OPCIONES VARCHAR2,
                                  IV_ESTADO       VARCHAR2,
                                  IV_USUARIO_TRX  VARCHAR2,
                                  OC_CONSULTA        OUT SYS_REFCURSOR,
                                  OV_COD_RESPONSE    OUT VARCHAR2,
                                  OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_GET_OPCIONES_X_ROL( IV_OPCION         VARCHAR2,
                                  IV_ID_ROL         VARCHAR2,
                                  IV_USUARIO_TRX    VARCHAR2,--POR SI
                                  OC_LIST_MENU      OUT SYS_REFCURSOR,
                                  OC_LIST_SUBMENU   OUT SYS_REFCURSOR,
                                  OC_LIST_OPCIONES  OUT SYS_REFCURSOR,
                                  OV_COD_RESPONSE   OUT VARCHAR2,
                                  OV_MSJ_RESPONSE   OUT VARCHAR2);

END PKG_TI_SEG_TRX_ADMINISTRADOR;
/
CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY PKG_TI_SEG_TRX_ADMINISTRADOR IS

PROCEDURE PUB_CRUD_TEMPLATE(IV_OPCION        VARCHAR2,
                            IN_ID              NUMBER, 
                    OC_CONSULTA      OUT SYS_REFCURSOR,
                    OV_COD_RESPONSE  OUT VARCHAR2,
                    OV_MSJ_RESPONSE  OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  BEGIN
    DBMS_OUTPUT.PUT_LINE('TEMPLATE algo mas');
    /*IF IV_OPCION = 'IN' THEN
    ELSIF IV_OPCION = 'AC' THEN
    ELSIF IV_OPCION = 'EL' THEN
    ELSIF IV_OPCION = 'CG' THEN
    ELSIF IV_OPCION = 'CI' THEN
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCIÓN NO CONFIGURADA';
    END IF;*/
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE  :='COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_TEMPLATE;

PROCEDURE PUB_CRUD_EMPRESA(IV_OPCION          VARCHAR2,
                           IN_ID              NUMBER,    
                           IV_NOMBRE          VARCHAR2,
                           IV_RUC             VARCHAR2,
                           IV_DIRECCION       VARCHAR2,
                           IV_TELEFONO        VARCHAR2,
                           IV_ESTADO          VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_EMPRESA A WHERE A.ID = IN_ID;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON CÓDIGO = '||IN_ID;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_EMPRESA;
         
         INSERT INTO TI_SEG_EMPRESA(
           ID,
           NOMBRE,
           RUC,
           DIRECCION,
           TELEFONO,
           ESTADO,
           FECHA_INGRESO,
           USUARIO_INGRESO)
          VALUES(
           LN_INCREMENTAL,
           IV_NOMBRE,
           IV_RUC,
           IV_DIRECCION,
           IV_TELEFONO,
           IV_ESTADO,
           SYSDATE,
           IV_USUARIO_SESION);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_EMPRESA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_SEG_EMPRESA
          SET NOMBRE           =IV_NOMBRE,
              RUC              =IV_RUC,
              DIRECCION        =IV_DIRECCION,
              TELEFONO         =IV_TELEFONO,
              ESTADO           =IV_ESTADO,
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IN_ID;
        
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
        SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_EMPRESA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_SEG_EMPRESA
          SET 
              ESTADO           ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IN_ID;
        
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_EMPRESA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_EMPRESA;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
        OPEN OC_CONSULTA FOR
         select * from TI_SEG_EMPRESA P WHERE P.ID = IN_ID;
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
END PUB_CRUD_EMPRESA;

PROCEDURE PUB_CRUD_AGENCIA(IV_OPCION          VARCHAR2,
                           IN_ID              VARCHAR2,     
                           IN_ID_EMPRESA      VARCHAR2,
                           IV_CODIGO_AGENCIA  VARCHAR2,
                           IV_NOMBRE_AGENCIA  VARCHAR2,
                           IV_DESCRIPCION     VARCHAR2,
                           IV_COD_HOMOLOGADO  VARCHAR2,
                           IV_ESTADO          VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_AGENCIA A WHERE A.CODIGO_AGENCIA = IV_CODIGO_AGENCIA;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON CÓDIGO = '||IV_CODIGO_AGENCIA;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_AGENCIA;
         
         INSERT INTO TI_SEG_AGENCIA(
           ID,
           ID_EMPRESA,
           CODIGO_AGENCIA,
           NOMBRE_AGENCIA,
           DESCRIPCION,
           COD_HOMOLOGADO,
           FECHA_INGRESO,
           USUARIO_INGRESO,
           FECHA_MODIFICACION,
           USUARIO_MODIFICACION)
          VALUES(
           LN_INCREMENTAL,
           IN_ID_EMPRESA,
           IV_CODIGO_AGENCIA,
           IV_NOMBRE_AGENCIA,
           IV_DESCRIPCION,
           IV_COD_HOMOLOGADO,
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
       FROM TI_SEG_AGENCIA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_SEG_AGENCIA
          SET ID_EMPRESA           =IN_ID_EMPRESA,
              CODIGO_AGENCIA       =IV_CODIGO_AGENCIA,
              NOMBRE_AGENCIA       =IV_NOMBRE_AGENCIA,
              DESCRIPCION          =IV_DESCRIPCION,
              COD_HOMOLOGADO       =IV_COD_HOMOLOGADO,
              ESTADO               ='S',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IN_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         UPDATE  TI_SEG_AGENCIA
          SET 
              ESTADO               ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IN_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_AGENCIA A;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_AGENCIA WHERE ID = IN_ID;
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
END PUB_CRUD_AGENCIA;

PROCEDURE PUB_RT_PRUEBA(IV_ENTRADA VARCHAR2,
                        IV_APE VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2)
AS
BEGIN
  OV_COD_RESPONSE := '00';
  OV_MSJ_RESPONSE := 'TRANSACCIÓN OK';
  OPEN OC_CONSULTA FOR
  SELECT 'KEVIN a ' || IV_ENTRADA AS NOMBRE, 'GALARZA '||IV_APE AS APELLIDO FROM DUAL;

END;

PROCEDURE PUB_GET_LOGIN(IV_USUARIO          VARCHAR2,
                        IV_CONTRASENIA      VARCHAR2, 
                        IV_ACT_DIRECT       VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2)
AS
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
   IF IV_ACT_DIRECT = 'S' THEN
     --SOLO BUSCAR USUARIO
     DBMS_OUTPUT.PUT_LINE('TEMPLATE algo mas');
   ELSE
     --LOGIN X USER Y PASS
     SELECT COUNT(*) INTO LN_EXISTE FROM TI_SEG_USUARIO U
     WHERE U.NOM_USUARIO = IV_USUARIO
      AND U.CLAVE_ACTUAL = IV_CONTRASENIA;
   END IF;
   --solo para pruebas
   OV_COD_RESPONSE := '00';
   OV_MSJ_RESPONSE := 'TRANSACCIÓN OK';
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCEDIMIENTO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   :='COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_GET_LOGIN;

PROCEDURE PUB_CRUD_PERSONA( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_TIPO_IDENTIFICACION VARCHAR2,
                            IV_ID_TIPO_SEXO VARCHAR2,
                            IV_NUM_IDENTIFICACION VARCHAR2,
                            IV_PRIMER_NOMBRE VARCHAR2,
                            IV_SEGUNDO_NOMBRE VARCHAR2,
                            IV_PRIMER_APELLIDO VARCHAR2,
                            IV_SEGUNDO_APELLIDO VARCHAR2,
                            IV_FECHA_NACIMIENTO VARCHAR2,
                            IV_DIRECCION_DOMICILIO VARCHAR2,
                            IV_DIRECCION_TRABAJO VARCHAR2,
                            IV_TELEFONO_DOMICILIO VARCHAR2,
                            IV_TELEFONO_TRABAJO VARCHAR2,
                            IV_OBSERVACION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_PERSONA A WHERE A.NUM_IDENTIFICACION = IV_NUM_IDENTIFICACION;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON IDENTIFICACIÓN = '||IV_NUM_IDENTIFICACION;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_PERSONA;
         
         INSERT INTO TI_SEG_PERSONA
            (ID, ID_TIPO_IDENTIFICACION, 
            ID_TIPO_SEXO, NUM_IDENTIFICACION, 
            PRIMER_NOMBRE, SEGUNDO_NOMBRE, 
            PRIMER_APELLIDO, SEGUNDO_APELLIDO, 
            FECHA_NACIMIENTO, DIRECCION_DOMICILIO, 
            DIRECCION_TRABAJO, TELEFONO_DOMICILIO, 
            TELEFONO_TRABAJO, OBSERVACION, 
            USUARIO_INGRESO, USUARIO_MODIFICACION)
          VALUES
            (LN_INCREMENTAL,
            IV_ID_TIPO_IDENTIFICACION,
            IV_ID_TIPO_SEXO,
            IV_NUM_IDENTIFICACION,
            IV_PRIMER_NOMBRE,
            IV_SEGUNDO_NOMBRE,
            IV_PRIMER_APELLIDO,
            IV_SEGUNDO_APELLIDO,
            IV_FECHA_NACIMIENTO,
            IV_DIRECCION_DOMICILIO,
            IV_DIRECCION_TRABAJO,
            IV_TELEFONO_DOMICILIO,
            IV_TELEFONO_TRABAJO,
            IV_OBSERVACION,
            IV_USUARIO_TRX,
            IV_USUARIO_TRX);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
        UPDATE TI_SEG_PERSONA
           SET 
               ID_TIPO_IDENTIFICACION = IV_ID_TIPO_IDENTIFICACION,
               ID_TIPO_SEXO = IV_ID_TIPO_SEXO,
               NUM_IDENTIFICACION = IV_NUM_IDENTIFICACION,
               PRIMER_NOMBRE = IV_PRIMER_NOMBRE,
               SEGUNDO_NOMBRE = IV_SEGUNDO_NOMBRE,
               PRIMER_APELLIDO = IV_PRIMER_APELLIDO,
               SEGUNDO_APELLIDO = IV_SEGUNDO_APELLIDO,
               FECHA_NACIMIENTO = IV_FECHA_NACIMIENTO,
               DIRECCION_DOMICILIO = IV_DIRECCION_DOMICILIO,
               DIRECCION_TRABAJO = IV_DIRECCION_TRABAJO,
               TELEFONO_DOMICILIO = IV_TELEFONO_DOMICILIO,
               TELEFONO_TRABAJO = IV_TELEFONO_TRABAJO,
               OBSERVACION = IV_OBSERVACION,
               ESTADO = 'S',
               FECHA_MODIFICACION = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_TRX
         WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
        UPDATE TI_SEG_PERSONA
           SET ESTADO = 'S',
               FECHA_MODIFICACION = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_TRX
         WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_PERSONA;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_PERSONA P WHERE P.ID = IV_ID;
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
END PUB_CRUD_PERSONA;

PROCEDURE PUB_CRUD_USUARIO( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_PERSONA VARCHAR2,
                            IV_ID_AGENCIA VARCHAR2,
                            IV_NOM_USUARIO VARCHAR2,
                            IV_CLAVE_ACTUAL VARCHAR2,
                            IV_INTENTOS_FALLIDOS VARCHAR2,
                            IV_ESTADO_BLOQUEO VARCHAR2,
                            IV_FECHA_EXPIRA_CLAVE VARCHAR2,
                            IV_USUARIO_HOMOLOGACION VARCHAR2,
                            IV_OBSERVACION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_USUARIO A 
       WHERE A.NOM_USUARIO = IV_NOM_USUARIO;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE USUARIO = '||IV_NOM_USUARIO;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_USUARIO;
         
         INSERT INTO TI_SEG_USUARIO
            (ID,
           ID_PERSONA,
           ID_AGENCIA,
           NOM_USUARIO,
           CLAVE_ACTUAL,
           INTENTOS_FALLIDOS,
           --ESTADO_BLOQUEO,
           FECHA_EXPIRA_CLAVE,
           USUARIO_HOMOLOGACION,
           OBSERVACION,
           USUARIO_INGRESO,
           USUARIO_MODIFICACION)
          VALUES
            (LN_INCREMENTAL,
           IV_ID_PERSONA,
           IV_ID_AGENCIA,
           IV_NOM_USUARIO,
           IV_CLAVE_ACTUAL,
           IV_INTENTOS_FALLIDOS,
           --IV_ESTADO_BLOQUEO,
           IV_FECHA_EXPIRA_CLAVE,
           IV_USUARIO_HOMOLOGACION,
           IV_OBSERVACION,
           IV_USUARIO_TRX,
           IV_USUARIO_TRX);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
            UPDATE TI_SEG_USUARIO
               SET ID_AGENCIA = IV_ID_AGENCIA,
                   NOM_USUARIO = IV_NOM_USUARIO,
                   --CLAVE_ACTUAL = IV_CLAVE_ACTUAL,
                   INTENTOS_FALLIDOS = IV_INTENTOS_FALLIDOS,
                   ESTADO_BLOQUEO = IV_ESTADO_BLOQUEO,
                   --CLAVE_ANTERIOR = IV_CLAVE_ANTERIOR,
                   --FECHA_ACTUALIZO_CLAVE = IV_FECHA_ACTUALIZO_CLAVE,
                   FECHA_EXPIRA_CLAVE = IV_FECHA_EXPIRA_CLAVE,
                   USUARIO_HOMOLOGACION = IV_USUARIO_HOMOLOGACION,
                   OBSERVACION = IV_OBSERVACION,
                   ESTADO = 'S',
                   USUARIO_INGRESO = IV_USUARIO_TRX,
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_TRX
             WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
            UPDATE TI_SEG_USUARIO
               SET ESTADO = 'N',
                   USUARIO_INGRESO = IV_USUARIO_TRX,
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_TRX
             WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_USUARIO;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_USUARIO P WHERE P.ID = IV_ID;
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
END PUB_CRUD_USUARIO;

PROCEDURE PUB_CRUD_MENU( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_NOMBRE VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_MENU A 
       WHERE A.NOMBRE = IV_NOMBRE;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE MENU = '||IV_NOMBRE;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_MENU;
         
         INSERT INTO TI_SEG_MENU
            (ID,
             NOMBRE,
             DESCRIPCION,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES
            (LN_INCREMENTAL,
             IV_NOMBRE,
             IV_DESCRIPCION,
             IV_USUARIO_TRX,
             IV_USUARIO_TRX);
         COMMIT;
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
END PUB_CRUD_MENU;

PROCEDURE PUB_CRUD_SUBMENU( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_MENU VARCHAR2,
                            IV_NOMBRE VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_SUBMENU A 
       WHERE A.NOMBRE = IV_NOMBRE;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE SUBMENU = '||IV_NOMBRE;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_SUBMENU;
         
         INSERT INTO TI_SEG_SUBMENU
            (ID,
             ID_MENU,
             NOMBRE,
             DESCRIPCION,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES
            (LN_INCREMENTAL,
             IV_ID_MENU,
             IV_NOMBRE,
             IV_DESCRIPCION,
             IV_USUARIO_TRX,
             IV_USUARIO_TRX);
         COMMIT;
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
END PUB_CRUD_SUBMENU;

PROCEDURE PUB_CRUD_OPCIONES( IV_OPCION          VARCHAR2,
                            IV_ID               VARCHAR2,
                            IV_ID_SUBMENU       VARCHAR2,
                            IV_NOMBRE           VARCHAR2,
                            IV_URL              VARCHAR2,
                            IV_DESCRIPCION      VARCHAR2,
                            IV_ESTADO           VARCHAR2,
                            IV_USUARIO_TRX      VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_OPCIONES A 
       WHERE A.NOMBRE = IV_NOMBRE;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE SUBMENU = '||IV_NOMBRE;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_OPCIONES;
         
         INSERT INTO TI_SEG_OPCIONES
            (ID,
             ID_SUBMENU,
             NOMBRE,
             URL,
             DESCRIPCION,
             --ESTADO,
             USUARIO_INGRESO,
             USUARIO_MODIFICACION)
          VALUES
            (LN_INCREMENTAL,
             IV_ID_SUBMENU,
             IV_NOMBRE,
             IV_URL,
             IV_DESCRIPCION,
             --IV_ESTADO,
             IV_USUARIO_TRX,
             IV_USUARIO_TRX);
         COMMIT;
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
END PUB_CRUD_OPCIONES;

PROCEDURE PUB_CRUD_ROL( IV_OPCION          VARCHAR2,
                            IV_ID          VARCHAR2,
                            IV_NOMBRE      VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO      VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_ROL A 
       WHERE A.NOMBRE = IV_NOMBRE;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE ROL = '||IV_NOMBRE;
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_ROL;
         
         INSERT INTO TI_SEG_ROL
            (ID,
           NOMBRE,
           DESCRIPCION,
           USUARIO_INGRESO,
           USUARIO_MODIFICACION)
         VALUES
            (LN_INCREMENTAL,
             IV_NOMBRE,
             IV_DESCRIPCION,
             IV_USUARIO_TRX,
             IV_USUARIO_TRX);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
           UPDATE TI_SEG_ROL
             SET NOMBRE = IV_NOMBRE,
                 DESCRIPCION = IV_DESCRIPCION,
                 ESTADO = 'S',--IV_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
            UPDATE TI_SEG_ROL
             SET ESTADO = 'N',--IV_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_ROL;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_ROL P WHERE P.ID = IV_ID;
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
END PUB_CRUD_ROL;

PROCEDURE PUB_CRUD_ROL_X_USUARIO( IV_OPCION          VARCHAR2,
                                  IV_ID          VARCHAR2,
                                  IV_ID_ROL      VARCHAR2,
                                  IV_ID_USUARIO  VARCHAR2,
                                  IV_ES_PRINCIPAL VARCHAR2,
                                  IV_ESTADO       VARCHAR2,
                                  IV_USUARIO_TRX  VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_ROL_USUARIO A 
       WHERE A.ID_ROL = IV_ID_ROL AND A.ID_USUARIO = IV_ID_USUARIO;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE REGISTRO';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_ROL_USUARIO;
         
         INSERT INTO TI_SEG_ROL_USUARIO
            (ID,
            ID_ROL,
            ID_USUARIO,
            ES_PRINCIPAL,
            --ESTADO,
            USUARIO_INGRESO,
            USUARIO_MODIFICACION)
          VALUES
            (LN_INCREMENTAL,
             IV_ID_ROL,
             IV_ID_USUARIO,
             IV_ES_PRINCIPAL,
             --IV_ESTADO,
             IV_USUARIO_TRX,
             IV_USUARIO_TRX);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
          UPDATE TI_SEG_ROL_USUARIO
             SET ES_PRINCIPAL = IV_ES_PRINCIPAL,
                 ESTADO = 'S',--V_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL_USUARIO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
            UPDATE TI_SEG_ROL_USUARIO
             SET ESTADO = 'N',--V_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_ROL;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_ROL P WHERE P.ID = IV_ID;
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
END PUB_CRUD_ROL_X_USUARIO;

PROCEDURE PUB_CRUD_OPC_X_ROL( IV_OPCION          VARCHAR2,
                                  IV_ID          VARCHAR2,
                                  IV_ID_ROL      VARCHAR2,
                                  IV_ID_OPCIONES VARCHAR2,
                                  IV_ESTADO       VARCHAR2,
                                  IV_USUARIO_TRX  VARCHAR2,
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
       SELECT COUNT(1) INTO LN_EXISTE FROM TI_SEG_ACCESOS A 
       WHERE A.ID_ROL = IV_ID_ROL AND A.ID_OPCIONES = IV_ID_OPCIONES;
      
     IF LN_EXISTE > 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'YA EXISTE REGISTRO';
       ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_ACCESOS;
         
         INSERT INTO TI_SEG_ACCESOS(
               ID,
               ID_ROL,
               ID_OPCIONES,
               --ESTADO,
               USUARIO_INGRESO,
               USUARIO_MODIFICACION)
            VALUES(
               LN_INCREMENTAL,
               IV_ID_ROL,
               IV_ID_OPCIONES,
               --V_ESTADO,
               IV_USUARIO_TRX,
               IV_USUARIO_TRX);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ACCESOS WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
          UPDATE TI_SEG_ACCESOS
             SET 
                 ESTADO = 'S', --V_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ACCESOS WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
            UPDATE TI_SEG_ACCESOS
             SET 
                 ESTADO = 'N', --V_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ACCESOS;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_ACCESOS;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCIÓN EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ACCESOS P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         OPEN OC_CONSULTA FOR
         select * from TI_SEG_ACCESOS P WHERE P.ID = IV_ID;
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
END PUB_CRUD_OPC_X_ROL;

PROCEDURE PUB_GET_OPCIONES_X_ROL( IV_OPCION         VARCHAR2,
                                  IV_ID_ROL         VARCHAR2,
                                  IV_USUARIO_TRX    VARCHAR2,--POR SI
                                  OC_LIST_MENU      OUT SYS_REFCURSOR,
                                  OC_LIST_SUBMENU   OUT SYS_REFCURSOR,
                                  OC_LIST_OPCIONES  OUT SYS_REFCURSOR,
                                  OV_COD_RESPONSE   OUT VARCHAR2,
                                  OV_MSJ_RESPONSE   OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    IF IV_OPCION = 'CG' THEN

       --LIST OPCIONES
        SELECT COUNT(*) INTO LN_EXISTE
        FROM TI_SEG_OPCIONES O
        WHERE O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A
        WHERE A.ID_ROL = 1) AND O.ESTADO = 'S';

       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACIÓN';
       ELSE
         --LIST OPCIONES
         OPEN OC_LIST_OPCIONES FOR --LIST OPCIONES
          SELECT O.ID, O.ID_SUBMENU, O.NOMBRE, O.URL, O.DESCRIPCION FROM TI_SEG_OPCIONES O
          WHERE O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A
          WHERE A.ID_ROL = IV_ID_ROL) AND O.ESTADO = 'S';

         OPEN OC_LIST_SUBMENU FOR --LIST SUB MENU
         SELECT S.ID, S.ID_MENU, S.NOMBRE, S.DESCRIPCION FROM TI_SEG_SUBMENU S
         WHERE S.ESTADO = 'S' 
          AND S.ID IN (SELECT O.ID FROM TI_SEG_OPCIONES O 
                      WHERE O.ESTADO = 'S' AND O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A WHERE A.ID_ROL = IV_ID_ROL));

         OPEN OC_LIST_MENU FOR --LIST MENU
         SELECT M.ID, M.NOMBRE, M.DESCRIPCION FROM TI_SEG_MENU M
         WHERE M.ESTADO = 'S'
          AND M.ID IN (SELECT S.ID FROM TI_SEG_SUBMENU S
          WHERE S.ESTADO = 'S' 
          AND S.ID IN (SELECT O.ID FROM TI_SEG_OPCIONES O 
                       WHERE O.ESTADO = 'S' AND O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A WHERE A.ID_ROL = IV_ID_ROL)));


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
END PUB_GET_OPCIONES_X_ROL;

END PKG_TI_SEG_TRX_ADMINISTRADOR;
/
