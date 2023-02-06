CREATE TABLE "prod-dynamo"."ygg_confirming_operacion_dte" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_confirming_operacion_dte/'
) AS
SELECT 
    Item.empRut.N as emp_rut,
    Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
    Item.detalle.M.emisorRazonSocial.S as detalle_emisor_razon_social,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fechas_emision,
    CAST (Item.detalle.M.fechas.M.vencimiento.S as DATE) as detalle_fechas_vencimiento,
    CAST(From_iso8601_timestamp(Item.detalle.M.fechas.M.vencimientoOriginal.S) AS timestamp) as detalle_fechas_vencimiento_original,
    Item.detalle.M.folio.N as detalle_folio,
    Item.detalle.M.montos.M.anticipo.N as detalle_montos_anticipo,
    Item.detalle.M.montos.M.diferenciaPrecio.N as detalle_montos_diferencia_precio,
    Item.detalle.M.montos.M.excedentes.N as detalle_montos_excedentes,
    Item.detalle.M.montos.M.giro.N as detalle_montos_giro,
    Item.detalle.M.montos.M.total.N as detalle_montos_total,
    Item.detalle.M.pgcId.N as detalle_pgc_id,
    Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
    Item.detalle.M.receptorRut.N as detalle_receptor_rut,
    Item.detalle.M.simId.N as detalle_sim_id,
    Item.detalle.M.tipoConfirming.S as detalle_tipo_confirming,
    Item.detalle.M.tipoDte.N as detalle_tipo_dte,
    Item.emisorRazonSocial.S as emisor_razon_social,
    Item.emisorRut.N as emisor_rut,
    Item.empRut_emisorRut.S as emp_rut_emisor_rut,
    Item.empRut_hasRecaudacion.S as emp_rut_has_recaudacion,
    Item.empRut_tipoConfirming.S as emp_rut_tipo_confirming,
    CAST (Item.fechaVencimiento.S as DATE) as fecha_vencimiento
    --Item.fechaVencimiento.S as fecha_vencimiento
FROM "prod-dynamo"."ddb_ygg_confirming_operacion_dte";
