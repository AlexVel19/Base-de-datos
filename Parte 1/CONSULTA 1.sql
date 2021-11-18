--consulta 1
SELECT 
extract (year from mantenimiento.mantenimiento_fecha_e) as año,
(tecnico.tecnico_nombre || ' ' || tecnico.tecnico_apellido ) as Tecnico,
count (mantenimiento) as mantenimientos_realizados
FROM mantenimiento
inner join tecnico on mantenimiento.tecnico_id=tecnico.tecnico_id 
WHERE to_char(mantenimiento.mantenimiento_fecha_e, 'YYYY') = '2021' 
group by año, tecnico




