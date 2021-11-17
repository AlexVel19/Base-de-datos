do $$ 
declare 
	persona record;
	c_persona cursor for select tecnico.tecnico_genero as genero,
	count (mantenimiento) as mantenimientos_realizados,
	sum (mantenimiento.mantenimiento_costo) as total
	from mantenimiento
	inner join tecnico on mantenimiento.tecnico_id = tecnico.tecnico_id
	where tecnico_genero = 'MASCULINO'
	group by genero	;
begin
open c_persona;
fetch c_persona into persona;
while(found) loop 
raise notice 'genero: %, mantenimientos_realizados: %, total: %',
			 persona.genero, persona.mantenimientos_realizados, persona.total;
fetch c_persona into persona;
end loop;
end $$
language 'plpgsql'