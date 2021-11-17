--consulta 3
select 
extract (year from mantenimiento.mantenimiento_fecha_e) as año,
producto_tipo.producto_tipo_nombre as nombre,
sum (mantenimiento_costo) as total
from mantenimiento
inner join producto_mantenimiento on mantenimiento.mantenimiento_id = producto_mantenimiento.mantenimiento_id
inner join producto on producto_mantenimiento.producto_id=producto.producto_id
inner join producto_tipo on producto.producto_tipo_id = producto_tipo.producto_tipo_id
where to_char(mantenimiento.mantenimiento_fecha_e, 'YYYY') = '2021'  and mantenimiento_completado = 'true'
group by año,  nombre
