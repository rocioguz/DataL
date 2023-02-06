CREATE TABLE "prod-dynamo"."ygg_condiciones_comerciales" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_condiciones_comerciales/'
) AS
SELECT 
    Item.empRut.N as empRut,
    financistas.M.razonSocial.S as financistas_razon_social,
    financistas.M.rut.N as financistas_rut,
    CAST(From_iso8601_timestamp(financistas.M.fechaCreacion.S) AS timestamp) as financistas_fecha_creacion,
    CAST(From_iso8601_timestamp(financistas.M.fechaModificacion.S) AS timestamp) as financistas_fecha_modificacion,
    financistas.M.financiamientoDirecto.M.escenario.S as financistas_financiamientoDirecto_escenario,
    financistas.M.financiamientoDirecto.M.tramos.L as financistas_financiamientoDirecto_tramos
FROM "prod-dynamo"."ddb_ygg_condiciones_comerciales",
UNNEST(Item.financistas.L) as t(financistas)
order by Item.empRut.N  desc
