create or replace function obtener_tecnico(
	in tecnicoNmbre varchar,
	out año varchar,
	out total money
)
as $body$
begin 
	select extract(year from mantenimiento.mantenimiento_fecha_e)as año,
	sum ( mantenimiento.mantenimiento_costo) as total
	into año,total
	from mantenimiento
	inner join tecnico on mantenimiento.tecnico_id = tecnico.tecnico_id
	where tecnico.tecnico_nombre  = tecnicoNmbre
	group by año;
end
$body$
language 'plpgsql'