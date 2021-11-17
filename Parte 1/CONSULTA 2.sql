--consulta 2
select 
extract (year from ventas.ventas_fecha) as año,
producto.producto_nombre as producto,
Sum (ventas_total) as total
from ventas
inner join producto on ventas.producto_id = producto.producto_id
where ventas.producto_id = 1
group by año, producto;