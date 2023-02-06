CREATE TABLE "prod-dynamo"."ygg_pronto_pago_nomina" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_pronto_pago_nomina/'
) AS
SELECT 
    Item.empRut.N as emp_rut,
    Item.timestamp.N as timestamp,
    Item.cantidadDtes.N as cantidad_dtes,
    Item.cantidadProveedores.N as cantidad_proveedores,
    date_parse(Item.fechaActualizacion.S,'%Y-%m-%d %H:%i:%s') as fecha_actualizacion,
    date_parse(Item.fechaCreacion.S,'%Y-%m-%d %H:%i:%s') as fecha_creacion,
    Item.montoTotal.N as monto_total
FROM "prod-dynamo"."ddb_ygg_pronto_pago_nomina";
