CREATE TABLE "prod-dynamo"."ygg_cesion_historial" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_cesion_historial/'
) AS
SELECT 
    Item.empRut.N as emp_rut,
    Item.timestamp.N as time_stamp,
    Item.detalle.M.cesionario.M.email.S as detalle_cesionario_email,
    Item.detalle.M.cesionario.M.razonSocial.S as detalle_razon_social,
    Item.detalle.M.cesionario.M.rut.N as detalle_cesionario_rut,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    Item.detalle.M.folio.N as detalle_folio,
    Item.detalle.M.montoCesion.N as detalle_monto_cesion,
    Item.detalle.M.tipoDte.N as detalle_tipo_dte,
    Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
    Item.usuarioId.S as usuario_id
FROM "prod-dynamo"."ddb_ygg_cesion_historial";
