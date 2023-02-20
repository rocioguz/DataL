CREATE TABLE "prod-dynamo"."ygg_confirming_historial_tasas_mora" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_confirming_historial_tasas_mora/'
) AS
SELECT CAST (Item.empRut.N AS int) as emp_rut,
  CAST(
    From_iso8601_timestamp(Item.fechaCreacion.S) AS timestamp
  ) as fecha_creacion,
  CAST(
    From_iso8601_timestamp(Item.fechaModificacion.S) AS timestamp
  ) as fecha_modificacion,
  CAST (
    Item.tasasMora.M.financiamientoDirecto.N AS double
  ) as tasas_mora_financiamiento_directo
FROM "prod-dynamo"."ddb_ygg_confirming_historial_tasas_mora";
