--consulta 4
select 
extract(year from producto.producto_fecha_e) as año,
proveedor.proveedor_nombre as proveedor,
sum (producto_precio * producto_stock) as total_compras
from producto
inner join proveedor on producto.proveedor_id = proveedor.proveedor_id
where proveedor.proveedor_id = producto.proveedor_id and to_char(producto_fecha_e, 'YYYY') = '2021'
group by año,proveedor