CREATE TABLE "prod-dynamo"."ygg_cesion_historial" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_cesion_historial/'
) AS
SELECT CAST (Item.empRut.N AS int) as emp_rut,
  Item.timestamp.N as time_stamp,
  Item.detalle.M.cesionario.M.email.S as detalle_cesionario_email,
  Item.detalle.M.cesionario.M.razonSocial.S as detalle_razon_social,
  CAST (Item.detalle.M.cesionario.M.rut.N AS int) as detalle_cesionario_rut,
  CAST (Item.detalle.M.emisorRut.N AS int) as detalle_emisor_rut,
  CAST (Item.detalle.M.folio.N AS int) as detalle_folio,
  CAST (Item.detalle.M.montoCesion.N AS int) as detalle_monto_cesion,
  CAST (Item.detalle.M.tipoDte.N AS int) as detalle_tipo_dte,
  Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
  Item.usuarioId.S as usuario_id
FROM "prod-dynamo"."ddb_ygg_cesion_historial";
