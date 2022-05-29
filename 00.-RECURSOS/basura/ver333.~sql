insert into ti_seg_accesos
  (id, id_rol, id_opciones, estado, fecha_ingreso, usuario_ingreso, fecha_modificacion, usuario_modificacion)
values
  (v_id, v_id_rol, v_id_opciones, v_estado, v_fecha_ingreso, v_usuario_ingreso, v_fecha_modificacion, v_usuario_modificacion);

update ti_seg_accesos
   set id = v_id,
       id_rol = v_id_rol,
       id_opciones = v_id_opciones,
       estado = v_estado,
       fecha_ingreso = v_fecha_ingreso,
       usuario_ingreso = v_usuario_ingreso,
       fecha_modificacion = v_fecha_modificacion,
       usuario_modificacion = v_usuario_modificacion
 where id = v_id;
 
 select p.*, rowid from ti_seg_opciones p
 
 SELECT * FROM TI_SEG_ROL
