--consulta 2
select 
extract (year from ventas.ventas_fecha) as año,
producto.producto_nombre as producto,
Sum (ventas_total) as total
from ventas
inner join producto_ventas on ventas.ventas_id = producto_ventas.ventas_id
inner join producto on producto_ventas.producto_id = producto.producto_id
where producto_ventas.producto_id = 1 and to_char(ventas_fecha, 'YYYY' ) = '2021'
group by año, producto;

