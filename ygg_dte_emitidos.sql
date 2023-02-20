CREATE TABLE "prod-dynamo"."ygg_dte_emitidos" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_dte_emitidos/'
) AS
SELECT CAST (Item.empRut.N as int) as emp_rut,
  Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
  Item.annoMes_empRut.S as anno_mes_emp_rut,
  Item.annoMes_empRut_hasCesion.S as anno_mes_emp_rut_has_cesion,
  Item.cesiones.L as cesiones,
  Item.detalle.M.emisorRazonSocial.S as detalle_emisor_razon_social,
  CAST (Item.detalle.M.emisorRut.N as int) as detalle_emisor_rut,
  Item.detalle.M.eventoReceptor.S as detalle_evento_receptor,
  Item.detalle.M.eventoReceptorLeyenda.S as detalle_evento_receptor_leyenda,
  CAST(
    From_iso8601_timestamp(Item.detalle.M.fechas.M.acuse.S) AS timestamp
  ) as detalle_fecha_acuse,
  CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fecha_emision,
  CAST(
    From_iso8601_timestamp(Item.detalle.M.fechas.M.recepcion.S) AS timestamp
  ) as detalle_fecha_recepcion,
  CAST (Item.detalle.M.folio.N as int) as detalle_folio,
  CAST (Item.detalle.M.montos.M.afecto.N as bigint) as detalle_monto_afecto,
  CAST (Item.detalle.M.montos.M.exento.N as bigint) as detalle_monto_exento,
  CAST (Item.detalle.M.montos.M.iva.N as bigint) as detalle_monto_iva,
  CAST (Item.detalle.M.montos.M.total.N as bigint) as detalle_monto_total,
  CAST (Item.detalle.M.porVencer.BOOL as boolean) as detalle_por_vencer,
  Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
  CAST (Item.detalle.M.receptorRut.N as int) as detalle_receptor_rut,
  CAST (Item.detalle.M.tipoDte.N as int) as detalle_tipo_dte,
  Item.empRut_porVencer.S as emp_rut__por_vencer,
  Item.eventoReceptor.S as evento_receptor,
  CAST (Item.factoring.M.empRut.N as int) as factoring_emp_rut,
  Item.factoring.M.fechaOperacion.S as factoring_fecha_operacion,
  CAST (Item.factoring.M.pgcId.N as int) as factoring_pgc_id,
  date_parse(Item.fechaCreacion.S, '%Y-%m-%d %H:%i:%s') as fecha_creacion,
  CAST (Item.fechaEmision.S as DATE) as fecha_emision,
  date_parse(Item.fechaModificacion.S, '%Y-%m-%d %H:%i:%s') as fecha_modificacion,
  Item.folio.S as folio,
  Item.hashCesiones.M as hash_cesiones,
  CAST (Item.montoTotal.N as bigint) as monto_total,
  Item.notasCD.L as notas_cd,
  Item.origen.S as origen,
  Item.pgcDataHash.S as pgc_data_hash,
  Item.razonSocial.S as razon_social,
  Item.recaudaciones.M as recaudaciones,
  Item.receptorRut.S as receptor_rut,
  Item.rutaXml.S as ruta_xml
FROM "prod-dynamo"."ddb_ygg_dte_emitidos"
