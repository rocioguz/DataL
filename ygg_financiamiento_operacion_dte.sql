CREATE TABLE "prod-dynamo"."ygg_financiamiento_operacion_dte" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_financiamiento_operacion_dte/'
) AS
SELECT 
    Item.receptorRut.N as receptor_rut,
    Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
    Item.detalle.M.receptorRut.N as detalle_receptor_rut,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    Item.detalle.M.estado.M.id.N as detalle_estado_id,
    Item.detalle.M.estado.M.nombre.S as detalle_estado_nombre,
    CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fechas_emision,
    CAST(From_iso8601_timestamp(Item.detalle.M.fechas.M.prorroga.S) AS timestamp) as detalle_fechas_prorroga,
    CAST (Item.detalle.M.fechas.M.vencimiento.S as DATE) as detalle_fechas_vencimiento,
    Item.detalle.M.folio.N as detalle_folio,
    Item.detalle.M.montos.M.anticipo.N as detalle_montos_anticipo,
    Item.detalle.M.montos.M.diferenciaPrecio.N as detalle_montos_diferencia_precio,
    Item.detalle.M.montos.M.excedentes.N as detalle_montos_excedentes,
    Item.detalle.M.montos.M.giro.N as detalle_montos_giro,
    Item.detalle.M.montos.M.total.N as detalle_montos_total,
    Item.detalle.M.observacion.S as detalle_observacion,
    Item.detalle.M.pgcId.N as detalle_pgc_id,
    Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
    Item.detalle.M.tipoDte.N as detalle_tipo_dte,
    Item.detalle.M.tipoFinanciamiento.S as detalle_tipo_financiamiento,
    Item.emisorRazonSocial.S as emisor_razon_social,
    Item.emisorRut.N as emisor_rut,
    Item.empRut.N as emp_rut,
    Item.empRut_estado.S as emp_rut_estado,
    Item.recaudaciones.M.datos1.M.diasMora.N as recaudaciones_datos1_diasMora, --Falta corregir
    CAST(From_iso8601_timestamp(Item.fechaVencimiento.S) AS timestamp) as fecha_vencimiento,
    --Item.fechaVencimiento.S as fecha_vencimiento,
    Item.receptorRut_emisorRut.S as receptor_rut_emisor_rut,
    Item.receptorRut_hasRecaudacion.S as receptor_rut_has_recaudacion,
    Item.receptorRut_tipoFinanciamiento.S as receptor_rut_tipo_financiamiento
FROM "prod-dynamo"."ddb_ygg_financiamiento_operacion_dte";
