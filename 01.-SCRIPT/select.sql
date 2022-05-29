SELECT A.*, ROWID FROM TI_SEG_ACCESOS A;

select m.*, rowid from ti_seg_menu m;
select s.*, rowid from ti_seg_submenu s;
select o.*, rowid from ti_seg_opciones o;

select * from ti_seg_usuario;
SELECT *
       FROM TI_SEG_PERSONA;

SELECT A.ID, A.NOMBRE_AGENCIA FROM TI_SEG_AGENCIA A
WHERE A.ESTADO = 'S';
