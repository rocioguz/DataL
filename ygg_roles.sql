CREATE TABLE "prod-dynamo"."ygg_roles" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_roles/'
) AS
SELECT 
    Item.id.S as id,
    Item.empRut.N as emp_rut,
    Item.nombre.S as nombre,
    Item.permisos.SS as permisos
FROM "prod-dynamo"."ddb_ygg_roles";
