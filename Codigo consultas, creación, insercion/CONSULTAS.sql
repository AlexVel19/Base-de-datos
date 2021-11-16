--consulta 1
SELECT 
(tecnico.tecnico_nombre || ' ' || tecnico.tecnico_apellido ) as Tecnico,
extract (year from mantenimiento.mantenimiento_fecha_e) as año,
count (mantenimiento) as mantenimientos_realizados
FROM mantenimiento
inner join tecnico on mantenimiento.tecnico_id=tecnico.tecnico_id 
WHERE to_char(mantenimiento.mantenimiento_fecha_e, 'YYYY') = '2021' 
group by año, tecnico


--consulta 2
select 
extract (year from ventas.ventas_fecha) as año,
producto.producto_nombre as producto,
Sum (ventas_total) as total
from ventas
inner join producto on ventas.producto_id = producto.producto_id
where ventas.producto_id = 1
group by año, producto;

--consulta 3
extract (year from mantenimiento.mantenimiento_fecha_e) as año,
producto_tipo.producto_tipo_nombre as nombre,
sum (mantenimiento_costo) as total
from mantenimiento
inner join producto_mantenimiento on mantenimiento.mantenimiento_id = producto_mantenimiento.mantenimiento_id
inner join producto on producto_mantenimiento.producto_id=producto.producto_id
inner join producto_tipo on producto.producto_tipo_id = producto_tipo.producto_tipo_id
where to_char(mantenimiento.mantenimiento_fecha_e, 'YYYY') = '2021'  
group by año,  nombre
--consulta 4
select 
extract(year from producto.producto_fecha_e) as año,
proveedor.proveedor_nombre as proveedor,
sum (producto_precio * producto_stock) as total_compras
from producto
inner join proveedor on producto.proveedor_id = proveedor.proveedor_id
where proveedor.proveedor_id = producto.proveedor_id and to_char(producto_fecha_e, 'YYYY') = '2021'
group by año,proveedor
