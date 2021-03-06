--1) CREACI�N DE TABLAS DEL ESQUEMA DE SEGURIDAD
--1.1
CREATE TABLE TI_SEG_EMPRESA(
  ID                   NUMBER NOT NULL,
  NOMBRE               VARCHAR2(200),
  RUC                  VARCHAR2(15),
  DIRECCION            VARCHAR2(50),
  TELEFONO             VARCHAR2(15),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,,
  FECHA_INGRESO        DATE,
  USUARIO_INGRESO      VARCHAR2(30),
  FECHA_MODIFICACION   DATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);

--1.2
CREATE TABLE TI_SEG_AGENCIA(
  ID                   NUMBER NOT NULL,
  ID_EMPRESA           NUMBER,
  CODIGO_AGENCIA       VARCHAR2(8),
  NOMBRE_AGENCIA       VARCHAR2(100),
  DESCRIPCION          VARCHAR2(100),
  COD_HOMOLOGADO       VARCHAR2(8),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,,
  FECHA_INGRESO        DATE,
  USUARIO_INGRESO      VARCHAR2(30),
  FECHA_MODIFICACION   DATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);

--1.3
CREATE TABLE TI_SEG_PERSONA(
  ID                         NUMBER NOT NULL,
  ID_TIPO_IDENTIFICACION     NUMBER NOT NULL,
  ID_TIPO_SEXO               NUMBER NOT NULL,
  NUM_IDENTIFICACION         VARCHAR2(15) NOT NULL,
  PRIMER_NOMBRE              VARCHAR2(40),
  SEGUNDO_NOMBRE             VARCHAR2(40),
  PRIMER_APELLIDO            VARCHAR2(40),
  SEGUNDO_APELLIDO           VARCHAR2(40),
  FECHA_NACIMIENTO           DATE,
  DIRECCION_DOMICILIO        VARCHAR2(200),
  DIRECCION_TRABAJO          VARCHAR2(200),
  TELEFONO_DOMICILIO         VARCHAR2(30),
  TELEFONO_TRABAJO           VARCHAR2(30),
  OBSERVACION                VARCHAR2(1000),
  ESTADO                     CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO              DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);
--1.4
CREATE TABLE TI_SEG_USUARIO(
  ID                   NUMBER NOT NULL,
  ID_PERSONA           NUMBER NOT NULL,
  ID_AGENCIA           NUMBER NOT NULL,
  NOM_USUARIO          VARCHAR(50) NOT NULL,
  CLAVE_ACTUAL         VARCHAR2(300) NOT NULL,
  INTENTOS_FALLIDOS    NUMBER DEFAULT 0,
  ESTADO_BLOQUEO       CHAR(1) DEFAULT 'N',-- EST. SOLO BLOQUEO
  CLAVE_ANTERIOR        VARCHAR2(300),
  FECHA_ACTUALIZO_CLAVE DATE,
  FECHA_EXPIRA_CLAVE    DATE,
  USUARIO_HOMOLOGACION  VARCHAR2(30),
  OBSERVACION           VARCHAR2(400),
  ESTADO                CHAR(1) DEFAULT 'S' NOT NULL,--ACT O INAC GENERAL
  FECHA_INGRESO         DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO       VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION    DATE DEFAULT SYSDATE,--ACTUALIZACION REGISTRO GNRAL.
  USUARIO_MODIFICACION  VARCHAR2(30),
  PRIMARY KEY(ID)
);
--ALTER TABLE TI_SEG_USUARIO ADD ID_AGENCIA NUMBER NOT NULL;

--1.5
CREATE TABLE TI_SEG_ROL(
  ID                   NUMBER NOT NULL,
  NOMBRE               VARCHAR2(30) NOT NULL,
  DESCRIPCION          VARCHAR2(100),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);

--1.6
CREATE TABLE TI_SEG_ROL_USUARIO(
  ID                   NUMBER NOT NULL,
  ID_ROL               NUMBER NOT NULL,
  ID_USUARIO           NUMBER NOT NULL,
  ES_PRINCIPAL         CHAR(1) DEFAULT 'N',
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);

--1.7
CREATE TABLE TI_SEG_OPCIONES(
  ID                   NUMBER NOT NULL,
  ID_SUBMENU           NUMBER NOT NULL,--ID PADRE
  ORDEN 			   NUMBER,
  NOMBRE               VARCHAR2(25) NOT NULL,
  URL                  VARCHAR2(500) NOT NULL,
  DESCRIPCION          VARCHAR2(500),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);

--1.8
CREATE TABLE TI_SEG_ACCESOS( --ACESOS POR ROL
  ID                   NUMBER NOT NULL,
  ID_ROL               NUMBER NOT NULL,
  ID_OPCIONES          NUMBER NOT NULL,
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);

--1.9
CREATE TABLE TI_SEG_SUBMENU(
  ID                   NUMBER NOT NULL,
  ID_MENU              NUMBER NOT NULL,--ID PADRE
  ORDEN 			   NUMBER,
  NOMBRE               VARCHAR2(25) NOT NULL,
  URL                  VARCHAR2(500),
  DESCRIPCION          VARCHAR2(500),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);
--1.10
CREATE TABLE TI_SEG_MENU(
  ID                   NUMBER NOT NULL,
  ORDEN 			   NUMBER,
  NOMBRE               VARCHAR2(25) NOT NULL,
  URL                  VARCHAR2(500),
  DESCRIPCION          VARCHAR2(500),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);
--1.11
CREATE TABLE TI_SEG_PARAMETROS(
  ID                   NUMBER NOT NULL,
  GRUPO                VARCHAR(50),
  CLAVE                VARCHAR2(50),
  VALOR                VARCHAR2(200),
  STR_1                VARCHAR2(200),
  STR_2                VARCHAR2(200),
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);
--1.12

/*-- MI SCRIPT PLANTILLA
CREATE TABLE TI_SEG_ TEMPLATEXX(
  ID                   NUMBER NOT NULL,
  
  ESTADO               CHAR(1) DEFAULT 'S' NOT NULL,
  FECHA_INGRESO        DATE DEFAULT SYSDATE NOT NULL,
  USUARIO_INGRESO      VARCHAR2(30) NOT NULL,
  FECHA_MODIFICACION   DATE DEFAULT SYSDATE,
  USUARIO_MODIFICACION VARCHAR2(30),
  PRIMARY KEY(ID)
);
*/

--2 CLAVES FORANEAS Y CHECKS DE VALIDACION
--2.1
ALTER TABLE TI_SEG_AGENCIA ADD CONSTRAINT FK_AGE_EMP FOREIGN KEY(ID_EMPRESA) REFERENCES TI_SEG_EMPRESA(ID);
--2.2
ALTER TABLE TI_SEG_USUARIO ADD CONSTRAINT FK_USU_PER FOREIGN KEY(ID_PERSONA) REFERENCES TI_SEG_PERSONA(ID);
ALTER TABLE TI_SEG_USUARIO ADD CONSTRAINT FK_USU_AGE FOREIGN KEY(ID_AGENCIA) REFERENCES TI_SEG_AGENCIA(ID);
--2.3
ALTER TABLE TI_SEG_ROL_USUARIO ADD CONSTRAINT FK_RU_USU FOREIGN KEY(ID_USUARIO) REFERENCES TI_SEG_USUARIO(ID);
ALTER TABLE TI_SEG_ROL_USUARIO ADD CONSTRAINT FK_RU_ROL FOREIGN KEY(ID_ROL) REFERENCES TI_SEG_ROL(ID);
--2.4
ALTER TABLE TI_SEG_ACCESOS ADD CONSTRAINT FK_ACC_USU FOREIGN KEY(ID_USUARIO) REFERENCES TI_SEG_USUARIO(ID);
ALTER TABLE TI_SEG_ACCESOS ADD CONSTRAINT FK_ACC_ROL FOREIGN KEY(ID_ROL) REFERENCES TI_SEG_ROL(ID);






