CREATE TABLE "prod-dynamo"."ygg_oferta_financiamiento_directo" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_oferta_financiamiento_directo/'
) AS
SELECT CAST (Item.empRut.N as int) as emp_rut,
  Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
  Item.detalle.M.emisorRazonSocial.S as detalle_emisor_razon_social,
  CAST (Item.detalle.M.emisorRut.N as int) as detalle_emisor_rut,
  CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fechas_emision,
  CAST(
    From_iso8601_timestamp(Item.detalle.M.fechas.M.recepcion.S) AS timestamp
  ) as detalle_fechas_recepcion,
  CAST (Item.detalle.M.folio.N as int) as detalle_folio,
  CAST (Item.detalle.M.montos.M.iva.N as bigint) as detalle_montos_iva,
  CAST (Item.detalle.M.montos.M.total.N as bigint) as detalle_montos_total,
  Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
  CAST (Item.detalle.M.receptorRut.N as int) as detalle_receptor_rut,
  CAST (Item.detalle.M.tipoDte.N as int) as detalle_tipo_dte,
  CAST (Item.disponible.BOOL as boolean) as disponible,
  Item.empRut_disponible.S as emp_rut_disponible,
  Item.empRut_disponible_receptorRut.S as emp_rut_disponible_receptor_rut,
  CAST (Item.expired_at.N as int) as expired_at,
  date_parse(Item.fechaActualizacion.S, '%Y-%m-%d %H:%i:%s') as fecha_actualizacion,
  date_parse(Item.fechaCreacion.S, '%Y-%m-%d %H:%i:%s') as fecha_creacion,
  CAST (Item.fechaEmision.S as DATE) as fecha_emision,
  Item.folio.S as folio,
  Item.receptorRazonSocial.S as receptor_razon_social,
  Item.receptorRut.S as receptor_rut,
  Item.rutaXml.S as ruta_xml,
  Item.tipo.S as tipo
FROM "prod-dynamo"."ddb_ygg_oferta_financiamiento_directo";
