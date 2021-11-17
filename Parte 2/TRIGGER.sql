create or replace function tecnico_incom() returns trigger 
as
$tecnico_incom$
	declare 
		man_incomp int;
		
begin
	select count (mantenimiento.mantenimiento_completado) into man_incomp 
	from mantenimiento 
	where mantenimiento_completado = 'false';
	if (man_incomp>2) then 
	raise exception 'Este tecnico no ha completado 2 mantenimientos, no se le puede asignar más' ;
	end if; 
	return new;
end;
$tecnico_incom$
language plpgsql;
create trigger tecnico_incom before insert on mantenimiento for each row
execute procedure tecnico_incom();