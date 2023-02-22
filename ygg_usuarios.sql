CREATE TABLE "prod-dynamo"."ygg_usuarios" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_usuarios/'
) AS
SELECT 
    Item.correo.S as correo,
    CAST (Item.activo.N as int) as activo,
    Item.apellidos.S as apellidos,
    Item.cognitoId.S as cognito_id,
    Item.empresas.NS as empresas,
    CAST(From_iso8601_timestamp(Item.fechaCreacion.S) AS timestamp) as fecha_creacion,
    CAST(From_iso8601_timestamp(Item.fechaModificacion.S) AS timestamp) as fecha_modificacion,
    Item.nombres.S as nombres,
    CAST (Item.soporte.BOOL as boolean) as soporte,
    Item.telefono.S as telefono,
    CAST(From_iso8601_timestamp(Item.tyc.M.fechaAceptacion.S ) AS timestamp) as tyc_fecha_aceptacion,
    CAST(From_iso8601_timestamp(Item.tyc.M.fechaModificacion.S) AS timestamp) as tyc_fecha_modificacion,
    Item.tyc.M.version.S as tyc_version
FROM "prod-dynamo"."ddb_ygg_usuarios";
