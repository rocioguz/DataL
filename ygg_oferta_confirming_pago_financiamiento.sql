CREATE TABLE "prod-dynamo"."ygg_oferta_confirming_pago_financiamiento" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_oferta_confirming_pago_financiamiento/'
) AS
SELECT 
    Item.empRut.N as emp_rut,
    Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
    Item.detalle.M.emisorRazonSocial.S as detalle_emisor_razon_social,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fechas_emision,
    CAST (Item.detalle.M.fechas.M.pago.S as DATE) as detalle_fechas_pago,
    Item.detalle.M.financiamientoOpId.M.empRut.N as detalle_financiamiento_op_id_emp_rut,
    Item.detalle.M.financiamientoOpId.M.pgcId.N as detalle_financiamiento_op_id_pgc_id,
    Item.detalle.M.folio.N as detalle_folio,
    Item.detalle.M.montos.M.total.N as detalle_montos_total,
    Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
    Item.detalle.M.receptorRut.N as detalle_receptor_rut,
    Item.detalle.M.tipoDte.N as detalle_tipo_dte,
    Item.disponible.BOOL as disponible,
    Item.empRut_disponible.S as emp_rut_disponible,
    Item.expired_at.N as expired_at,
    date_parse(Item.fechaActualizacion.S,'%Y-%m-%d %H:%i:%s') as fecha_actualizacion,
    date_parse(Item.fechaCreacion.S,'%Y-%m-%d %H:%i:%s') as fecha_creacion,
    CAST (Item.fechaPago.S as DATE) as fecha_pago,
    Item.tipoFinanciamiento.S as tipo_financiamiento
FROM "prod-dynamo"."ddb_ygg_oferta_confirming_pago_financiamiento";
