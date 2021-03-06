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
 
PROCEDURE PUB_CRUD_MENU(IV_OPCION          VARCHAR2,
                        IV_ID              VARCHAR2,
                        IV_NOMBRE          VARCHAR2,
                        IV_DESCRIPCION     VARCHAR2,
                        IV_ESTADO          VARCHAR2,
                        IV_ORDEN           VARCHAR2,
                        IV_USUARIO_TRX     VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2);

PROCEDURE PUB_CRUD_SUBMENU( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_MENU VARCHAR2,
                            IV_NOMBRE VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_ORDEN           VARCHAR2,
                            IV_USUARIO_TRX VARCHAR2,
                            OC_CONSULTA        OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE    OUT VARCHAR2,
                            OV_MSJ_RESPONSE    OUT VARCHAR2);                                                                                             

PROCEDURE PUB_CRUD_OPCIONES(IV_OPCION           VARCHAR2,
                            IV_ID               VARCHAR2,
                            IV_ID_SUBMENU       VARCHAR2,
                            IV_NOMBRE           VARCHAR2,
                            IV_URL              VARCHAR2,
                            IV_DESCRIPCION      VARCHAR2,
                            IV_ESTADO           VARCHAR2,
                            IV_ORDEN           VARCHAR2,
                            IV_USUARIO_TRX      VARCHAR2,
                            OC_CONSULTA         OUT SYS_REFCURSOR,
                            OV_COD_RESPONSE     OUT VARCHAR2,
                            OV_MSJ_RESPONSE     OUT VARCHAR2);

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

PROCEDURE PUB_CRUD_OPC_X_ROL(IV_ID_ROL       VARCHAR2,
                             IV_ID_OPCIONES  VARCHAR2,
                             IV_ESTADO       VARCHAR2,
                             IV_USUARIO_TRX  VARCHAR2,
                             OC_CONSULTA     OUT SYS_REFCURSOR,
                             OV_COD_RESPONSE OUT VARCHAR2,
                             OV_MSJ_RESPONSE OUT VARCHAR2);

PROCEDURE PUB_GET_OPCIONES_X_ROL( IV_OPCION         VARCHAR2,
                                  IV_ID_ROL         VARCHAR2,
                                  IV_USUARIO_TRX    VARCHAR2,--POR SI
                                  OC_LIST_MENU      OUT SYS_REFCURSOR,
                                  OC_LIST_SUBMENU   OUT SYS_REFCURSOR,
                                  OC_LIST_OPCIONES  OUT SYS_REFCURSOR,
                                  OV_COD_RESPONSE   OUT VARCHAR2,
                                  OV_MSJ_RESPONSE   OUT VARCHAR2);
                                  
FUNCTION FN_TRANSF_DECIMALES(IV_VALOR VARCHAR2) return varchar2 ;

FUNCTION FN_VAL_USUARIO(IV_OPCION VARCHAR2,
                        IV_USUARIO VARCHAR2,
                        IV_CONTRASENIA VARCHAR2) RETURN VARCHAR2;
                        
PROCEDURE PUB_GET_PARAM_CMB(IV_OPCION          VARCHAR2,
                        IV_CRITERIO      VARCHAR2, 
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2); 

PROCEDURE PRV_UPD_INTENT_BLOQ_USER(IV_USUARIO           VARCHAR2,
                                   IN_INTENTOS_FALLIDOS NUMBER,
                                   IV_ESTADO_BLOQUEO    VARCHAR2,
                                   IV_USUARIO_TRX       VARCHAR2,
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
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;*/
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
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
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON C?DIGO = '||IN_ID;
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_EMPRESA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
        SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_EMPRESA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         UPDATE  TI_SEG_EMPRESA
          SET 
              ESTADO           ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IN_ID;
        
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_EMPRESA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_SEG_EMPRESA;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
        OPEN OC_CONSULTA FOR
         SELECT * FROM TI_SEG_EMPRESA P WHERE P.ID = IN_ID;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
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
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON C?DIGO = '||IV_CODIGO_AGENCIA;
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA WHERE ID = IN_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         UPDATE  TI_SEG_AGENCIA
          SET 
              ESTADO               ='N',
              FECHA_MODIFICACION   = SYSDATE,
              USUARIO_MODIFICACION = IV_USUARIO_SESION
          WHERE ID = IN_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT A.ID,
                A.ID_EMPRESA,
                A.CODIGO_AGENCIA,
                A.NOMBRE_AGENCIA,
                A.COD_HOMOLOGADO,
                A.DESCRIPCION,
                A.ESTADO,
                A.USUARIO_MODIFICACION,
                NVL(TO_CHAR(A.FECHA_MODIFICACION, 'DD/MM/YYYY'), ' ') FECHA_MODIFICACION
         FROM TI_SEG_AGENCIA A;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_AGENCIA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_SEG_AGENCIA WHERE ID = IN_ID;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
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
  OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
  OPEN OC_CONSULTA FOR
  SELECT 'KEVIN a ' || IV_ENTRADA AS NOMBRE, 'GALARZA '||IV_APE AS APELLIDO FROM DUAL;

END;

PROCEDURE PUB_GET_LOGIN(IV_USUARIO         VARCHAR2,
                        IV_CONTRASENIA     VARCHAR2, 
                        IV_ACT_DIRECT      VARCHAR2,
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2)
AS
 LN_EXISTE        NUMBER;
 LN_INTENTOS_FALL NUMBER;
 LN_RESTANTES     NUMBER := 3;
 LV_ES_VALIDO     VARCHAR2(6) := 'FALSE';
 LV_ESTADO_BLOQUEO char(1) := 'N';
 LV_BOOL_VALID char(1) := 'N';
 LV_COD_RESPONSE  VARCHAR2(4);
 LV_MSJ_RESPONSE  VARCHAR2(5000);
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    --1 VER SI EXISTE USUARIO
   SELECT COUNT(*) INTO LN_EXISTE 
   FROM TI_SEG_USUARIO U
   WHERE U.NOM_USUARIO = IV_USUARIO;
   
   IF LN_EXISTE > 0 THEN
       -- VER SI EL USUARIO SE ENCUENTRA ACTIVO
       SELECT COUNT(*) INTO LN_EXISTE 
       FROM TI_SEG_USUARIO U
       WHERE U.NOM_USUARIO = IV_USUARIO
       AND U.ESTADO = 'S';
       
       IF LN_EXISTE > 0 THEN
         --VER SI ES DIRECTORIO ACTIVO
          IF IV_ACT_DIRECT = 'S' THEN
               --VER SI EST? BLOQUEADO
               LV_BOOL_VALID := pkg_ti_seg_trx_administrador.fn_val_usuario(iv_opcion => 'B2',
                                                         iv_usuario => IV_USUARIO,
                                                         iv_contrasenia => '');
               IF LV_BOOL_VALID = 'S' THEN
                    OV_COD_RESPONSE := '02';
                    OV_MSJ_RESPONSE := 'USUARIO SE ENCUENTRA BLOQUEADO, COMUN?QUESE CON EL DEPARTAMENTO T?CNICO';
               ELSE
                  -- ver si usuario ESTA CONFIGURADO
                       LV_BOOL_VALID := pkg_ti_seg_trx_administrador.fn_val_usuario(iv_opcion => 'C2',
                                                               iv_usuario => IV_USUARIO,
                                                               iv_contrasenia => '');
                        
                       IF LV_BOOL_VALID = 'N' THEN
                          OV_COD_RESPONSE := '02';
                          OV_MSJ_RESPONSE := 'USUARIO NO SE ENCUENTRA CONFIGURADO PARA ACCEDER, COMUN?QUESE CON EL DEPARTAMENTO T?CNICO';
                       ELSE
                           OV_COD_RESPONSE := '00';
                           OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
                             
                           OPEN OC_CONSULTA FOR
                           SELECT A.ID AS ID_ROL_USU, A.ID_ROL, A.ID_USUARIO, U.NOM_USUARIO, R.NOMBRE
                           FROM TI_SEG_ROL_USUARIO A
                           JOIN TI_SEG_ROL R ON R.ID = A.ID_ROL
                           JOIN TI_SEG_USUARIO U ON U.ID = A.ID_USUARIO
                           WHERE U.NOM_USUARIO = IV_USUARIO
                           AND U.ESTADO = 'S';
                       END IF;
               END IF;
          ELSE
               -- VER SI CONTRASENIA ES CORRECTA    - aumentar en uno intentos fallidos
               SELECT COUNT(*) INTO LN_EXISTE 
               FROM TI_SEG_USUARIO U
               WHERE U.NOM_USUARIO = IV_USUARIO
               AND U.ESTADO = 'S'
               AND U.CLAVE_ACTUAL = IV_CONTRASENIA;
                 
               IF LN_EXISTE > 0 THEN 
                 -- ver si usuario no esta bloqueado
                 LV_BOOL_VALID := pkg_ti_seg_trx_administrador.fn_val_usuario(iv_opcion => 'B',
                                                         iv_usuario => IV_USUARIO,
                                                         iv_contrasenia => IV_CONTRASENIA);
                  
                 IF LV_BOOL_VALID = 'S' THEN
                    OV_COD_RESPONSE := '02';
                    OV_MSJ_RESPONSE := 'USUARIO SE ENCUENTRA BLOQUEADO, COMUN?QUESE CON EL DEPARTAMENTO T?CNICO';
                 ELSE
                      -- ver si usuario ESTA CONFIGURADO
                       LV_BOOL_VALID := pkg_ti_seg_trx_administrador.fn_val_usuario(iv_opcion => 'C',
                                                               iv_usuario => IV_USUARIO,
                                                               iv_contrasenia => IV_CONTRASENIA);
                        
                       IF LV_BOOL_VALID = 'N' THEN
                          OV_COD_RESPONSE := '02';
                          OV_MSJ_RESPONSE := 'USUARIO NO SE ENCUENTRA CONFIGURADO PARA ACCEDER, COMUN?QUESE CON EL DEPARTAMENTO T?CNICO';
                       ELSE
                           -- ver si usario tiene rol
                           -- ver si usuario tiene opciones asignadas por rol 
                           OV_COD_RESPONSE := '00';
                           OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
                             
                           OPEN OC_CONSULTA FOR
                           SELECT A.ID AS ID_ROL_USU, A.ID_ROL, A.ID_USUARIO, U.NOM_USUARIO, R.NOMBRE
                            FROM TI_SEG_ROL_USUARIO A
                            JOIN TI_SEG_ROL R ON R.ID = A.ID_ROL
                            JOIN TI_SEG_USUARIO U ON U.ID = A.ID_USUARIO
                            WHERE U.NOM_USUARIO = IV_USUARIO
                            AND U.CLAVE_ACTUAL  = IV_CONTRASENIA
                            AND U.ESTADO = 'S';
                       END IF;
                 END IF;
               ELSE
                 --AUMENTAR INTENTOS FALLIDOS
                 -- ver intentos inferiores a 3 
                 SELECT NVL(U.INTENTOS_FALLIDOS, 0)+1 INTO LN_INTENTOS_FALL 
                 FROM TI_SEG_USUARIO U
                 WHERE U.NOM_USUARIO = IV_USUARIO
                 AND U.ESTADO = 'S';
                 
                 IF LN_INTENTOS_FALL > 3 THEN
                    OV_COD_RESPONSE   := '02';
                    OV_MSJ_RESPONSE   := 'USUARIO BLOQUEADO';
                    LV_ESTADO_BLOQUEO := 'S';
                    LN_INTENTOS_FALL  := 3;
                    
                 ELSIF LN_INTENTOS_FALL = 3 THEN
                    OV_COD_RESPONSE   := '02';
                    OV_MSJ_RESPONSE   := 'INTENTOS AGOTADOS, EN EL SIGUIENTE INTENTO FALLIDO SU USUARIO SE BLOQUEAR?';
                    LV_ESTADO_BLOQUEO := 'N';
                    
                 ELSE     
                   LN_RESTANTES       := 3 - LN_INTENTOS_FALL;
                   OV_COD_RESPONSE    := '02';
                   OV_MSJ_RESPONSE    := 'CONTRASE?A INCORRECTA, LE QUEDAN '||LN_RESTANTES||' INTENTO(S) RESTANTE(S)';   
                   LV_ESTADO_BLOQUEO  := 'N';                                     
                 END IF;--VER INTENTOS FALLIDOS
                 
                 PKG_TI_SEG_TRX_ADMINISTRADOR.PRV_UPD_INTENT_BLOQ_USER(IV_USUARIO => IV_USUARIO,
                                                            IN_INTENTOS_FALLIDOS => LN_INTENTOS_FALL,
                                                            IV_ESTADO_BLOQUEO => LV_ESTADO_BLOQUEO,
                                                            IV_USUARIO_TRX => IV_USUARIO,
                                                            OV_COD_RESPONSE => LV_COD_RESPONSE,
                                                            OV_MSJ_RESPONSE => LV_MSJ_RESPONSE);
               END IF;--VER SI CONTRASENIA EXISTE 
          END IF; --VER SI ES POR DIRECTORIO ACTIVO O NO 
       ELSE
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'EL USUARIO NO SE ENCUENTRA ACTIVO';
       END IF;--VER SI USER INACTIVO
   ELSE
     OV_COD_RESPONSE := '02';
     OV_MSJ_RESPONSE := 'NO EXISTE USUARIO';
   END IF;--VER SI USER NO EXISTE
   
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCEDIMIENTO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
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
         OV_MSJ_RESPONSE := 'YA EXISTE EL REGISTRO CON IDENTIFICACI?N = '||IV_NUM_IDENTIFICACION;
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
        UPDATE TI_SEG_PERSONA
           SET ESTADO = 'N',
               FECHA_MODIFICACION = SYSDATE,
               USUARIO_MODIFICACION = IV_USUARIO_TRX
         WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT P.ID,
                 NVL(P.ID_TIPO_IDENTIFICACION, 0) ID_TIPO_IDENTIFICACION,
                 NVL(I.VALOR, ' ') AS DESC_TIP_IDENTIFICACION,
                 P.ID_TIPO_SEXO,
                 NVL(S.VALOR, ' ') DESC_SEXO,
                 NVL(P.NUM_IDENTIFICACION, ' ') NUM_IDENTIFICACION,
                 NVL(P.PRIMER_NOMBRE, ' ') PRIMER_NOMBRE,
                 NVL(P.SEGUNDO_NOMBRE, ' ') SEGUNDO_NOMBRE,
                 NVL(P.PRIMER_APELLIDO, ' ') PRIMER_APELLIDO,
                 NVL(P.SEGUNDO_APELLIDO, ' ') SEGUNDO_APELLIDO,
                 NVL(TO_CHAR(P.FECHA_NACIMIENTO, 'DD/MM/YYYY'), ' ') FECHA_NACIMIENTO,
                 NVL(P.DIRECCION_DOMICILIO, ' ') DIRECCION_DOMICILIO,
                 NVL(P.DIRECCION_TRABAJO, ' ') DIRECCION_TRABAJO,
                 NVL(P.TELEFONO_DOMICILIO, ' ') TELEFONO_DOMICILIO,
                 NVL(P.TELEFONO_TRABAJO, ' ') TELEFONO_TRABAJO,
                 NVL(P.OBSERVACION, ' ') OBSERVACION,
                 NVL(P.ESTADO, ' ') ESTADO,
                 NVL(P.USUARIO_MODIFICACION, ' ') USUARIO_MODIFICACION,
                 NVL(TO_CHAR(P.FECHA_MODIFICACION, 'DD/MM/YYYY'), ' ') FECHA_MODIFICACION
         FROM TI_SEG_PERSONA P
         JOIN TI_SEG_PARAMETROS I ON I.ID = P.ID_TIPO_IDENTIFICACION
         JOIN TI_SEG_PARAMETROS S ON S.ID = P.ID_TIPO_SEXO;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_PERSONA P 
       WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT P.ID,
                 NVL(P.ID_TIPO_IDENTIFICACION, 0) ID_TIPO_IDENTIFICACION,
                 NVL(I.VALOR, ' ') AS DESC_TIPO_IDENTIFICACION,
                 P.ID_TIPO_SEXO,
                 NVL(S.VALOR, ' ') DESC_TIPO_SEXO,
                 NVL(P.NUM_IDENTIFICACION, ' ') NUM_IDENTIFICACION,
                 NVL(P.PRIMER_NOMBRE, ' ') PRIMER_NOMBRE,
                 NVL(P.SEGUNDO_NOMBRE, ' ') SEGUNDO_NOMBRE,
                 NVL(P.PRIMER_APELLIDO, ' ') PRIMER_APELLIDO,
                 NVL(TO_CHAR(P.FECHA_NACIMIENTO, 'DD/MM/YYYY'), ' ') FECHA_NACIMIENTO,
                 NVL(P.DIRECCION_DOMICILIO, ' ') DIRECCION_DOMICILIO,
                 NVL(P.TELEFONO_DOMICILIO, ' ') TELEFONO_DOMICILIO,
                 NVL(P.OBSERVACION, ' ') OBSERVACION,
                 NVL(P.ESTADO, ' ') ESTADO,
                 NVL(P.USUARIO_MODIFICACION, ' ') USUARIO_MODIFICACION,
                 NVL(TO_CHAR(P.FECHA_MODIFICACION, 'DD/MM/YYYY'), ' ') USUARIO_MODIFICACION
          FROM TI_SEG_PERSONA P
          JOIN TI_SEG_PARAMETROS I ON I.ID = P.ID_TIPO_IDENTIFICACION
          JOIN TI_SEG_PARAMETROS S ON S.ID = P.ID_TIPO_SEXO 
         WHERE P.ID = IV_ID;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
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
             0,--IV_INTENTOS_FALLIDOS,
             --IV_ESTADO_BLOQUEO,
             IV_FECHA_EXPIRA_CLAVE,
             IV_USUARIO_HOMOLOGACION,
             IV_OBSERVACION,
             IV_USUARIO_TRX,
             IV_USUARIO_TRX);
           COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_USUARIO
               SET ID_AGENCIA          = IV_ID_AGENCIA,
                   ID_PERSONA          = IV_ID_PERSONA,
                   NOM_USUARIO         = IV_NOM_USUARIO,
                  -- CLAVE_ACTUAL = IV_CLAVE_ACTUAL,
                   INTENTOS_FALLIDOS   = IV_INTENTOS_FALLIDOS,
                   ESTADO_BLOQUEO      = IV_ESTADO_BLOQUEO,
                   --CLAVE_ANTERIOR = IV_CLAVE_ANTERIOR,
                   --FECHA_ACTUALIZO_CLAVE = IV_FECHA_ACTUALIZO_CLAVE,
                   FECHA_EXPIRA_CLAVE      = IV_FECHA_EXPIRA_CLAVE,
                   USUARIO_HOMOLOGACION    = IV_USUARIO_HOMOLOGACION,
                   OBSERVACION             = IV_OBSERVACION,
                   ESTADO                  = 'S',
                   USUARIO_INGRESO         = IV_USUARIO_TRX,
                   FECHA_MODIFICACION      = SYSDATE,
                   USUARIO_MODIFICACION    = IV_USUARIO_TRX
             WHERE ID                      = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_USUARIO
               SET ESTADO = 'N',
                   USUARIO_INGRESO = IV_USUARIO_TRX,
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_TRX
             WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO U
       JOIN TI_SEG_PERSONA P ON P.ID = U.ID_PERSONA
       JOIN TI_SEG_AGENCIA A ON A.ID = U.ID_AGENCIA;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT U.ID,
                 U.ID_PERSONA,
                 P.PRIMER_NOMBRE || ' ' ||P.PRIMER_APELLIDO || ' ' || P.SEGUNDO_APELLIDO AS NOMBRE,
                 U.ID_AGENCIA,
                 A.NOMBRE_AGENCIA,
                 NVL(U.NOM_USUARIO, ' ') NOM_USUARIO,
                 NVL(U.CLAVE_ACTUAL, ' ') CLAVE_ACTUAL,
                 U.INTENTOS_FALLIDOS,
                 NVL(U.ESTADO_BLOQUEO, ' ') ESTADO_BLOQUEO,
                 NVL(U.CLAVE_ANTERIOR, ' ') CLAVE_ANTERIOR,
                 NVL(TO_CHAR(U.FECHA_ACTUALIZO_CLAVE, 'DD/MM/YYYY'), ' ') FECHA_ACTUALIZO_CLAVE,
                 NVL(TO_CHAR(U.FECHA_EXPIRA_CLAVE, 'DD/MM/YYYY'), ' ') FECHA_EXPIRA_CLAVE,
                 NVL(U.USUARIO_HOMOLOGACION, ' ') USUARIO_HOMOLOGACION,
                 NVL(U.OBSERVACION, ' ') OBSERVACION,
                 NVL(U.ESTADO, ' ') ESTADO,
                 NVL(TO_CHAR(U.FECHA_MODIFICACION, 'DD/MM/YYYY'), ' ') FECHA_MODIFICACION,
                 NVL(U.USUARIO_MODIFICACION, ' ') USUARIO_MODIFICACION
          FROM TI_SEG_USUARIO U
          JOIN TI_SEG_PERSONA P ON P.ID = U.ID_PERSONA
          JOIN TI_SEG_AGENCIA A ON A.ID = U.ID_AGENCIA;
          
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_USUARIO U
       JOIN TI_SEG_PERSONA P ON P.ID = U.ID_PERSONA
       JOIN TI_SEG_AGENCIA A ON A.ID = U.ID_AGENCIA
       WHERE U.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT  U.ID,
                 U.ID_PERSONA,
                 U.ID_AGENCIA,
                 NVL(U.NOM_USUARIO, ' ') NOM_USUARIO,
                 NVL(U.CLAVE_ACTUAL, ' ') CLAVE_ACTUAL,
                 U.INTENTOS_FALLIDOS,
                 NVL(U.ESTADO_BLOQUEO, ' ') ESTADO_BLOQUEO,
                 NVL(U.CLAVE_ANTERIOR, ' ') CLAVE_ANTERIOR,
                 NVL(TO_CHAR(U.FECHA_ACTUALIZO_CLAVE, 'DD/MM/YYYY'), ' ') FECHA_ACTUALIZO_CLAVE,
                 NVL(TO_CHAR(U.FECHA_EXPIRA_CLAVE, 'DD/MM/YYYY'), ' ') FECHA_EXPIRA_CLAVE,
                 NVL(U.USUARIO_HOMOLOGACION, ' ') USUARIO_HOMOLOGACION,
                 NVL(U.OBSERVACION, ' ') OBSERVACION,
                 NVL(U.ESTADO, ' ') ESTADO,
                 NVL(TO_CHAR(U.FECHA_MODIFICACION, 'DD/MM/YYYY'), ' ') FECHA_MODIFICACION,
                 NVL(U.USUARIO_MODIFICACION, ' ') USUARIO_MODIFICACION
         FROM TI_SEG_USUARIO U
         JOIN TI_SEG_PERSONA P ON P.ID = U.ID_PERSONA
         JOIN TI_SEG_AGENCIA A ON A.ID = U.ID_AGENCIA
         WHERE U.ID = IV_ID;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   :='COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_USUARIO;

PROCEDURE PUB_CRUD_MENU(IV_OPCION          VARCHAR2,
                        IV_ID              VARCHAR2,
                        IV_NOMBRE          VARCHAR2,
                        IV_DESCRIPCION     VARCHAR2,
                        IV_ESTADO          VARCHAR2,
                        IV_ORDEN           VARCHAR2,
                        IV_USUARIO_TRX     VARCHAR2,
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    
    ELSIF IV_OPCION = 'CG' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_MENU M;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT M.ID,
                NVL(M.ORDEN, 0) ORDEN,
                NVL(M.NOMBRE, ' ') NOMBRE,
                NVL(M.DESCRIPCION, ' ') DESCRIPCION,
                M.ESTADO
         FROM TI_SEG_MENU M
         ORDER BY ID;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    
    
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_MENU WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_MENU
               SET NOMBRE                  = IV_NOMBRE,
                   ORDEN                   = IV_ORDEN, 
                   DESCRIPCION             = IV_DESCRIPCION,
                   ESTADO                  = 'S',
                   USUARIO_INGRESO         = IV_USUARIO_TRX,
                   FECHA_MODIFICACION      = SYSDATE,
                   USUARIO_MODIFICACION    = IV_USUARIO_TRX
             WHERE ID                      = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_MENU WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_MENU
               SET ESTADO = 'N',
                   USUARIO_INGRESO = IV_USUARIO_TRX,
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_TRX
             WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
   
    
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   :='COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_MENU;

PROCEDURE PUB_CRUD_SUBMENU( IV_OPCION          VARCHAR2,
                            IV_ID VARCHAR2,
                            IV_ID_MENU VARCHAR2,
                            IV_NOMBRE VARCHAR2,
                            IV_DESCRIPCION VARCHAR2,
                            IV_ESTADO VARCHAR2,
                            IV_ORDEN           VARCHAR2,
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    
    ELSIF IV_OPCION = 'CG' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_SUBMENU M
       JOIN TI_SEG_MENU X ON X.ID = M.ID_MENU
       ORDER BY M.ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT M.ID,
                NVL(M.ORDEN, 0) ORDEN,
                M.ID_MENU,
                X.NOMBRE NOM_MENU,
                NVL(M.NOMBRE, ' ') NOMBRE,
                NVL(M.DESCRIPCION, ' ') DESCRIPCION,
                M.ESTADO
         FROM TI_SEG_SUBMENU M
         JOIN TI_SEG_MENU X ON X.ID = M.ID_MENU
         ORDER BY M.ID;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    
    
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_SUBMENU WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_SUBMENU
               SET NOMBRE                  = IV_NOMBRE,
                   ORDEN                   = IV_ORDEN, 
                   DESCRIPCION             = IV_DESCRIPCION,
                   ID_MENU                 = IV_ID_MENU,
                   ESTADO                  = 'S',
                   USUARIO_INGRESO         = IV_USUARIO_TRX,
                   FECHA_MODIFICACION      = SYSDATE,
                   USUARIO_MODIFICACION    = IV_USUARIO_TRX
             WHERE ID                      = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_SUBMENU WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_SUBMENU
               SET ESTADO = 'N',
                   USUARIO_INGRESO = IV_USUARIO_TRX,
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_TRX
             WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
   
    
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_SUBMENU;

PROCEDURE PUB_CRUD_OPCIONES(IV_OPCION           VARCHAR2,
                            IV_ID               VARCHAR2,
                            IV_ID_SUBMENU       VARCHAR2,
                            IV_NOMBRE           VARCHAR2,
                            IV_URL              VARCHAR2,
                            IV_DESCRIPCION      VARCHAR2,
                            IV_ESTADO           VARCHAR2,
                            IV_ORDEN           VARCHAR2,
                            IV_USUARIO_TRX      VARCHAR2,
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_SUBMENU M
       JOIN TI_SEG_MENU X ON X.ID = M.ID_MENU
       ORDER BY M.ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT O.ID,
                NVL(O.ORDEN, 0) ORDEN,
                O.ID_SUBMENU,
                NVL(X.NOMBRE, ' ') || ' > '||NVL(S.NOMBRE, ' ') NOM_SUBMENU,
                NVL(O.NOMBRE, ' ') NOMBRE,
                NVL(O.DESCRIPCION, ' ') DESCRIPCION,
                O.URL,
                O.ESTADO
         FROM TI_SEG_OPCIONES O
         JOIN TI_SEG_SUBMENU S ON S.ID = O.ID_SUBMENU
         JOIN TI_SEG_MENU X ON X.ID = S.ID_MENU
         ORDER BY O.ID;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    
    
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_OPCIONES WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_OPCIONES
               SET NOMBRE                  = IV_NOMBRE,
                   ORDEN                   = IV_ORDEN, 
                   DESCRIPCION             = IV_DESCRIPCION,
                   ID_SUBMENU              = IV_ID_SUBMENU,
                   ESTADO                  = 'S',
                   URL                     = IV_URL,
                   USUARIO_INGRESO         = IV_USUARIO_TRX,
                   FECHA_MODIFICACION      = SYSDATE,
                   USUARIO_MODIFICACION    = IV_USUARIO_TRX
             WHERE ID                      = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_OPCIONES WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_OPCIONES
               SET ESTADO = 'N',
                   USUARIO_INGRESO = IV_USUARIO_TRX,
                   FECHA_MODIFICACION = SYSDATE,
                   USUARIO_MODIFICACION = IV_USUARIO_TRX
             WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
   
    
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_ROL
             SET ESTADO = 'N',--IV_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT R.ID,
                NVL(R.NOMBRE, '') NOMBRE,
                NVL(R.DESCRIPCION, '') DESCRIPCION,
                R.ESTADO,
                R.USUARIO_MODIFICACION,
                NVL(TO_CHAR(R.FECHA_MODIFICACION, 'DD/MM/YYYY'), '') FECHA_MODIFICACION
         FROM TI_SEG_ROL R;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT R.ID,
                NVL(R.NOMBRE, '') NOMBRE,
                NVL(R.DESCRIPCION, '') DESCRIPCION,
                R.ESTADO,
                R.USUARIO_MODIFICACION,
                NVL(TO_CHAR(R.FECHA_MODIFICACION, 'DD/MM/YYYY'), '') FECHA_MODIFICACION
         FROM TI_SEG_ROL R WHERE R.ID = IV_ID;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
         
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
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
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'AC' THEN
      SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
          UPDATE TI_SEG_ROL_USUARIO
             SET ES_PRINCIPAL = IV_ES_PRINCIPAL,
                 ID_ROL = IV_ID_ROL,
                 ID_USUARIO = IV_ID_USUARIO,
                 ESTADO = 'S',--V_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'EL' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL_USUARIO WHERE ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
            UPDATE TI_SEG_ROL_USUARIO
             SET ESTADO = 'N',--V_ESTADO,
                 FECHA_MODIFICACION = SYSDATE,
                 USUARIO_MODIFICACION = IV_USUARIO_TRX
           WHERE ID = IV_ID;
          COMMIT;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSIF IV_OPCION = 'CG' THEN
      
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT A.ID,
                A.ID_ROL,
                R.NOMBRE,
                A.ID_USUARIO,
                U.NOM_USUARIO,
                A.ES_PRINCIPAL,
                CASE A.ES_PRINCIPAL WHEN 'S' THEN 'SI'
                     WHEN 'N' THEN 'NO' 
                     ELSE ' ' END AS DESC_ES_PRINCIPAL,
                A.ESTADO
         FROM TI_SEG_ROL_USUARIO A
         JOIN TI_SEG_ROL R ON R.ID = A.ID_ROL
         JOIN TI_SEG_USUARIO U ON U.ID = A.ID_USUARIO;
         
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
       
    ELSIF IV_OPCION = 'CI' THEN
       SELECT COUNT(*) INTO LN_EXISTE
       FROM TI_SEG_ROL P WHERE P.ID = IV_ID;
       
       IF LN_EXISTE = 0 THEN
         OV_COD_RESPONSE := '02';
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         OPEN OC_CONSULTA FOR
         SELECT * FROM TI_SEG_ROL P WHERE P.ID = IV_ID;
         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   :='ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   :='COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_CRUD_ROL_X_USUARIO;

PROCEDURE PUB_CRUD_OPC_X_ROL(IV_ID_ROL       VARCHAR2,
                             IV_ID_OPCIONES  VARCHAR2,
                             IV_ESTADO       VARCHAR2,
                             IV_USUARIO_TRX  VARCHAR2,
                             OC_CONSULTA     OUT SYS_REFCURSOR,
                             OV_COD_RESPONSE OUT VARCHAR2,
                             OV_MSJ_RESPONSE OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
       SELECT COUNT(1) INTO LN_EXISTE 
       FROM TI_SEG_ACCESOS A 
       WHERE A.ID_ROL = IV_ID_ROL AND A.ID_OPCIONES = IV_ID_OPCIONES;
      
     IF LN_EXISTE > 0 THEN
         UPDATE TI_SEG_ACCESOS A
         SET ESTADO               = IV_ESTADO,
             FECHA_MODIFICACION   = SYSDATE,
             USUARIO_MODIFICACION = IV_USUARIO_TRX
         WHERE A.ID_ROL = IV_ID_ROL AND A.ID_OPCIONES = IV_ID_OPCIONES;
     ELSE
         SELECT NVL(MAX(ID),0)+1 INTO LN_INCREMENTAL
         FROM TI_SEG_ACCESOS;
         
         INSERT INTO TI_SEG_ACCESOS(
               ID,
               ID_ROL,
               ID_OPCIONES,
               ESTADO,
               USUARIO_INGRESO,
               USUARIO_MODIFICACION)
         VALUES(
               LN_INCREMENTAL,
               IV_ID_ROL,
               IV_ID_OPCIONES,
               IV_ESTADO,
               IV_USUARIO_TRX,
               IV_USUARIO_TRX);
       END IF;
       COMMIT;
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
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
         OV_MSJ_RESPONSE := 'NO EXISTE INFORMACI?N';
       ELSE
         --LIST OPCIONES
         OPEN OC_LIST_OPCIONES FOR --LIST OPCIONES
         SELECT O.ID, O.ID_SUBMENU, O.NOMBRE, O.URL, O.DESCRIPCION FROM TI_SEG_OPCIONES O
         WHERE O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A
         WHERE A.ID_ROL = IV_ID_ROL AND A.ESTADO = 'S') AND O.ESTADO = 'S'
         ORDER BY O.ORDEN;

         OPEN OC_LIST_SUBMENU FOR --LIST SUB MENU
         SELECT S.ID, S.ID_MENU, S.NOMBRE, S.DESCRIPCION 
         FROM TI_SEG_SUBMENU S
         WHERE S.ESTADO = 'S' 
         AND S.ID IN (SELECT O.ID_SUBMENU FROM TI_SEG_OPCIONES O 
                      WHERE O.ESTADO = 'S' AND O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A WHERE A.ID_ROL = IV_ID_ROL AND A.ESTADO = 'S'))
         ORDER BY S.ORDEN;

         OPEN OC_LIST_MENU FOR --LIST MENU
         SELECT M.ID, M.NOMBRE, M.DESCRIPCION FROM TI_SEG_MENU M
         WHERE M.ESTADO = 'S'
          AND M.ID IN (SELECT S.ID_MENU FROM TI_SEG_SUBMENU S
          WHERE S.ESTADO = 'S' 
          AND S.ID IN (SELECT O.ID_SUBMENU FROM TI_SEG_OPCIONES O 
                       WHERE O.ESTADO = 'S' AND O.ID IN (SELECT A.ID_OPCIONES FROM TI_SEG_ACCESOS A WHERE A.ID_ROL = IV_ID_ROL AND A.ESTADO = 'S')))
          ORDER BY M.ORDEN;


         OV_COD_RESPONSE := '00';
         OV_MSJ_RESPONSE := 'TRANSACCI?N EXISTOSA';
       END IF;
    ELSE
      OV_COD_RESPONSE := '02';
      OV_MSJ_RESPONSE := 'OPCI?N NO CONFIGURADA';
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.';
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_GET_OPCIONES_X_ROL;

FUNCTION FN_TRANSF_DECIMALES(IV_VALOR VARCHAR2) RETURN VARCHAR2 
IS
 LV_ENTERO VARCHAR2(40);
 LV_DECIMAL VARCHAR2(40);
BEGIN
  SELECT SUBSTR(IV_VALOR,1,INSTR(IV_VALOR, '.', 1, 1)-1) 
         INTO LV_ENTERO
  FROM DUAL; 
  
  IF LV_ENTERO IS NOT NULL THEN 
     SELECT SUBSTR(IV_VALOR,INSTR(IV_VALOR, '.', 1, 1)+1, 2) 
         INTO LV_DECIMAL
     FROM DUAL; 
  ELSE
    RETURN IV_VALOR || '.' || '00';
  END IF;
  
  RETURN LV_ENTERO || '.' || RPAD(LV_DECIMAL, 2,'0');
END FN_TRANSF_DECIMALES;

FUNCTION FN_VAL_USUARIO(IV_OPCION VARCHAR2,
                        IV_USUARIO VARCHAR2,
                        IV_CONTRASENIA VARCHAR2) RETURN VARCHAR2 
IS
 LV_ENTERO VARCHAR2(40);
 LV_ES_BLOQ VARCHAR2(5);
 LN_EXISTE NUMBER;
 LV_ES_VALID CHAR(1) := 'N';
BEGIN
  IF IV_OPCION = 'B' THEN --VER BLOQUEO 
      SELECT U.ESTADO_BLOQUEO INTO LV_ES_BLOQ
      FROM TI_SEG_USUARIO U 
      WHERE U.NOM_USUARIO = IV_USUARIO
      AND U.CLAVE_ACTUAL  = IV_CONTRASENIA
      AND U.ESTADO = 'S';
      
      LV_ES_VALID := LV_ES_BLOQ;-- S, N
  
  ELSIF IV_OPCION = 'B2' THEN --VER BLOQUEO SI ES DIRECTORIO ACTIVO
      SELECT U.ESTADO_BLOQUEO INTO LV_ES_BLOQ
      FROM TI_SEG_USUARIO U 
      WHERE U.NOM_USUARIO = IV_USUARIO
      AND U.ESTADO = 'S';
      
      LV_ES_VALID := LV_ES_BLOQ;-- S, N
  
  ELSIF IV_OPCION = 'C' THEN --VER USUARIO CONFIGURADO OCN ROL Y ACCESOS
      
      SELECT COUNT(1) INTO LN_EXISTE
      FROM TI_SEG_ROL_USUARIO R
      JOIN TI_SEG_USUARIO U ON U.ID = R.ID_USUARIO
      JOIN TI_SEG_ACCESOS A ON A.ID_ROL = R.ID
      WHERE U.NOM_USUARIO = IV_USUARIO
      AND U.CLAVE_ACTUAL  = IV_CONTRASENIA
      AND R.ESTADO = 'S'
      AND A.ESTADO = 'S';
      
      IF LN_EXISTE = 0 THEN
        LV_ES_VALID := 'N'; 
      ELSE
        LV_ES_VALID := 'S';  
      END IF;
  ELSIF IV_OPCION = 'C2' THEN --VER USUARIO CONFIGURADO CON ROL Y ACCESOS POR DIRECTORIO ACTIVO
      
      SELECT COUNT(1) INTO LN_EXISTE
      FROM TI_SEG_ROL_USUARIO R
      JOIN TI_SEG_USUARIO U ON U.ID = R.ID_USUARIO
      JOIN TI_SEG_ACCESOS A ON A.ID_ROL = R.ID
      WHERE U.NOM_USUARIO = IV_USUARIO
      AND R.ESTADO = 'S'
      AND A.ESTADO = 'S';
      
      IF LN_EXISTE = 0 THEN
        LV_ES_VALID := 'N'; 
      ELSE
        LV_ES_VALID := 'S';  
      END IF;     
  ELSE
    LV_ES_VALID := 'N';
  END IF;
  
  RETURN LV_ES_VALID;
END FN_VAL_USUARIO;

PROCEDURE PUB_GET_PARAM_CMB(IV_OPCION          VARCHAR2,
                        IV_CRITERIO      VARCHAR2, 
                        OC_CONSULTA        OUT SYS_REFCURSOR,
                        OV_COD_RESPONSE    OUT VARCHAR2,
                        OV_MSJ_RESPONSE    OUT VARCHAR2)
AS
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
    --TI
   IF IV_OPCION = 'TI' THEN --TIPOS DE IDENTIFICACION
     
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_PARAMETROS P
     WHERE P.GRUPO = 'TIPO_INDETIFICACION'
     AND P.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT P.ID, P.VALOR
       FROM TI_SEG_PARAMETROS P
       WHERE P.GRUPO = 'TIPO_INDETIFICACION'
       AND P.ESTADO = 'S';
     END IF;
     
      
   ELSIF IV_OPCION = 'SX' THEN --TIPOS DE SEXO
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_PARAMETROS P
     WHERE P.GRUPO = 'TIPO_SEXO'
     AND P.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT P.ID, P.VALOR
       FROM TI_SEG_PARAMETROS P
       WHERE P.GRUPO = 'TIPO_SEXO'
       AND P.ESTADO = 'S';
     END IF;
     
   ELSIF IV_OPCION = 'AG' THEN --CMB AGENCIAS
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_AGENCIA P
     WHERE P.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT P.ID, P.NOMBRE_AGENCIA
       FROM TI_SEG_AGENCIA P
       WHERE P.ESTADO = 'S'
       ORDER BY ID;
     END IF;
   
   ELSIF IV_OPCION = 'MN' THEN --COMBO MENUS
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_MENU M
     WHERE M.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT M.ID,
                NVL(M.NOMBRE, ' ') VALOR
       FROM TI_SEG_MENU M
       WHERE M.ESTADO = 'S'
       ORDER BY ID;
     END IF;  
   
   
   
   ELSIF IV_OPCION = 'SB' THEN --COMBO SUBMENUS
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_SUBMENU M
     JOIN TI_SEG_MENU X ON X.ID = M.ID_MENU
     WHERE M.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT M.ID,
              NVL(X.NOMBRE, ' ') || ' > '||NVL(M.NOMBRE, ' ') VALOR
        FROM TI_SEG_SUBMENU M
        JOIN TI_SEG_MENU X ON X.ID = M.ID_MENU
        WHERE M.ESTADO = 'S'
        ORDER BY M.ID;
     END IF;  
   
   
   ELSIF IV_OPCION = 'US' THEN --COMBO USUARIO
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_USUARIO U
     WHERE U.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
        SELECT U.ID, U.NOM_USUARIO AS VALOR
        FROM TI_SEG_USUARIO U
        WHERE U.ESTADO = 'S';
     END IF;  
   
   
   ELSIF IV_OPCION = 'RL' THEN --COMBO ROL
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_ROL U
     WHERE U.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT U.ID, U.NOMBRE AS VALOR
       FROM TI_SEG_ROL U
       WHERE U.ESTADO = 'S';
     END IF;  
     
   
   ELSIF IV_OPCION = 'RLS' THEN --TABLA ROLES
     SELECT COUNT(1) INTO LN_EXISTE
     FROM TI_SEG_ROL U
     WHERE U.ESTADO = 'S';
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT U.ID, U.NOMBRE, U.DESCRIPCION, U.ESTADO
       FROM TI_SEG_ROL U
       WHERE U.ESTADO = 'S';
     END IF;   
     
   ELSIF IV_OPCION = 'OPS' THEN --TABLA OPCIONES (ACCESOS) X ROL
     SELECT COUNT(1) INTO LN_EXISTE
     FROM  TI_SEG_OPCIONES OP
     JOIN TI_SEG_SUBMENU S ON S.ID = OP.ID_SUBMENU
     JOIN TI_SEG_MENU M ON M.ID = S.ID_MENU
     LEFT JOIN (
             SELECT A.ID, A.ESTADO, A.ID_OPCIONES
             FROM TI_SEG_ACCESOS A 
             JOIN TI_SEG_ROL R ON R.ID = A.ID_ROL AND R.ID = IV_CRITERIO/*ID ROL*/
             JOIN TI_SEG_OPCIONES O ON O.ID = A.ID_OPCIONES  
       ) TBL ON TBL.ID_OPCIONES = OP.ID;
       
     IF LN_EXISTE = 0 THEN
       OV_COD_RESPONSE := '02';
       OV_MSJ_RESPONSE := 'NO HAY DATOS';
     ELSE
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
       
       OPEN OC_CONSULTA FOR
       SELECT OP.ID, 
              M.NOMBRE NOM_MENU,
              S.NOMBRE NOM_SUBMENU,
              OP.NOMBRE, 
              CASE WHEN TBL.ESTADO IS NULL THEN 'N' ELSE TBL.ESTADO END AS ACCESO
       FROM  TI_SEG_OPCIONES OP
       JOIN TI_SEG_SUBMENU S ON S.ID = OP.ID_SUBMENU
       JOIN TI_SEG_MENU M ON M.ID = S.ID_MENU
       LEFT JOIN (
             SELECT A.ID, A.ESTADO, A.ID_OPCIONES
             FROM TI_SEG_ACCESOS A 
             JOIN TI_SEG_ROL R ON R.ID = A.ID_ROL AND R.ID = IV_CRITERIO/*ID ROL*/
             JOIN TI_SEG_OPCIONES O ON O.ID = A.ID_OPCIONES  
       ) TBL ON TBL.ID_OPCIONES = OP.ID
       ORDER BY OP.ID;
     END IF; 
   ELSE
     OV_COD_RESPONSE := '02';
     OV_MSJ_RESPONSE := 'OPCION NO CONFIGURADA';
   END IF;

  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCEDIMIENTO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PUB_GET_PARAM_CMB;

PROCEDURE PRV_UPD_INTENT_BLOQ_USER(IV_USUARIO           VARCHAR2,
                                   IN_INTENTOS_FALLIDOS NUMBER,
                                   IV_ESTADO_BLOQUEO    VARCHAR2,
                                   IV_USUARIO_TRX       VARCHAR2,
                                   OV_COD_RESPONSE   OUT VARCHAR2,
                                   OV_MSJ_RESPONSE   OUT VARCHAR2)
AS
 LN_INCREMENTAL NUMBER;
 LN_EXISTE NUMBER;
BEGIN
  OV_COD_RESPONSE := '01';
  OV_MSJ_RESPONSE := 'NO SE PUDO EJECUTAR LA SOLICITUD EN LA BASE';
  BEGIN
       UPDATE TI_SEG_USUARIO U
       SET U.INTENTOS_FALLIDOS    =  IN_INTENTOS_FALLIDOS,
           U.ESTADO_BLOQUEO       = IV_ESTADO_BLOQUEO,
           U.USUARIO_MODIFICACION = IV_USUARIO,
           U.FECHA_MODIFICACION   = SYSDATE
       WHERE U.NOM_USUARIO = IV_USUARIO
       AND U.ESTADO = 'S';
       
       COMMIT;
       OV_COD_RESPONSE := '00';
       OV_MSJ_RESPONSE := 'TRANSACCI?N OK';
  EXCEPTION
    WHEN OTHERS THEN
      OV_COD_RESPONSE   := '99' ;
      OV_MSJ_RESPONSE   := 'ERROR EN EL PROCESO DE BASE DE DATOS.'||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200);
      OV_MSJ_RESPONSE   := 'COD=>' || OV_COD_RESPONSE ||'.. MSJ=>'|| OV_MSJ_RESPONSE ||'.. COD ORA=>'|| SUBSTR(SQLCODE, 1, 5) ||'.. MSJ ORA=>'|| SUBSTR(SQLERRM, 1, 200) || '.. ERROR GRAL=>'|| $$PLSQL_UNIT || '.. LINEA EXP=>' || $$PLSQL_LINE || '.. LINEA ERROR=>' ||DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
  END;
END PRV_UPD_INTENT_BLOQ_USER;


END PKG_TI_SEG_TRX_ADMINISTRADOR;
/
