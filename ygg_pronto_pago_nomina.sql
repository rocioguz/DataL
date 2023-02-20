CREATE TABLE "prod-dynamo"."ygg_pronto_pago_nomina" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ddb_ygg_pronto_pago_nomina/'
) AS
SELECT CAST (Item.empRut.N as int) as emp_rut,
  Item.timestamp.N as timestamp,
  CAST (Item.cantidadDtes.N as int) as cantidad_dtes,
  CAST (Item.cantidadProveedores.N as int) as cantidad_proveedores,
  date_parse(Item.fechaActualizacion.S, '%Y-%m-%d %H:%i:%s') as fecha_actualizacion,
  date_parse(Item.fechaCreacion.S, '%Y-%m-%d %H:%i:%s') as fecha_creacion,
  CAST (Item.montoTotal.N as bigint) as monto_total
FROM "prod-dynamo"."ddb_ygg_pronto_pago_nomina";
