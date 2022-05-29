select * from ti_seg_parametros;
select * from ti_seg_empresa;
select * from ti_seg_agencia;
select * from ti_seg_persona;
select u.*, rowid from ti_seg_usuario u;
select * from ti_seg_rol;

select * from ti_seg_menu;
select * from ti_seg_submenu;
select * from ti_seg_opciones;

select * from ti_seg_rol_usuario;
select * from ti_seg_accesos;

--tablas de infraestructura

select c.* from ti_app_caracteristicas c;
select c.* from ti_app_ip c;
select c.* from ti_app_telefono c;

--1275, 1271     3
select * 
from ti_app_ip i
left join ti_app_telefono t on t.ip = i.id 
left join ti_app_caracteristicas c on c.ip = i.id 
where t.ip is null and c.ip is null
and i.segmento = 3


/*
DELETE FROM ti_seg_usuario;
DELETE FROM ti_seg_menu;
COMMIT;
*/
