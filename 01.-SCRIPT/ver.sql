 /*SELECT X.ID, X.ID_ROL, R.NOMBRE, X.ID_USUARIO, U.NOM_USUARIO, X.ES_PRINCIPAL, X.ESTADO, X.FECHA_MODIFICACION, X.USUARIO_MODIFICACION
 FROM TI_SEG_ROL_USUARIO X
 JOIN TI_SEG_USUARIO U ON U.ID = X.ID_USUARIO
 JOIN TI_SEG_ROL R ON R.ID = X.ID_ROL;
 */
 
 SELECT U.ID, U.NOMBRE VALOR FROM TI_SEG_SUBMENU U
 WHERE U.ESTADO = 'S';
 
 
select U.INTENTOS_FALLIDOS from ti_seg_usuario u
where u.nom_usuario =
and u.clave_actual =
and u.estado_bloqueo = 'N'

SELECT U.*, ROWID
FROM TI_SEG_USUARIO U
                      

 