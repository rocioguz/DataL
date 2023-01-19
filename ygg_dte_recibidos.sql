SELECT 
    Item.empRut.N as emp_rut,
    Item.emisorRut_folio_tipoDte.S as emisorRut_folio_tipoDte,
    Item.annoMes_empRut.S as annoMes_empRut,
    Item.annoMes_empRut_hasCesion.S as annoMes_empRut_hasCesion,
    Item.detalle.M.emisorRazonSocial.S as detalle_emisor_razon_social,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    Item.detalle.M.eventoReceptor.S as detalle_evento_receptor,
    Item.detalle.M.eventoReceptorLeyenda.S as detalle_evento_receptor_leyenda,
    CAST(From_iso8601_timestamp(Item.detalle.M.fechas.M.acuse.S) AS timestamp) as detalle_fechas_acuse,
    CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fechas_emision,
    CAST(From_iso8601_timestamp(Item.detalle.M.fechas.M.recepcion.S) AS timestamp) as detalle_fechas_recepcion,
    Item.detalle.M.folio.N as detalle_folio,
    Item.detalle.M.montos.M.afecto.N as detalle_montos_afecto,
    Item.detalle.M.montos.M.exento.N as detalle_montos_exento,
    Item.detalle.M.montos.M.iva.N as detalle_montos_iva,
    Item.detalle.M.montos.M.total.N as detalle_montos_total,
    Item.detalle.M.porVencer.BOOL as detalle_por_vencer_total,
    Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
    Item.detalle.M.receptorRut.N as detalle_receptor_rut,
    Item.detalle.M.tipoDte.N as detalle_tipo_dte,
    Item.emisorRut.S as emisor_rut,
    Item.empRut_confirming_pago_proveedores_enabled.S as emp_rut_confirming_pago_proveedores_enabled,
    Item.empRut_porVencer.S as emp_rut_por_vencer,
    Item.eventoReceptor.S as evento_receptor,
    date_parse(Item.fechaCreacion.S,'%Y-%m-%d %H:%i:%s') as fecha_creacion,
    CAST (Item.fechaEmision.S as DATE) as fecha_emision,
    date_parse(Item.fechaModificacion.S,'%Y-%m-%d %H:%i:%s') as fecha_modificacion,
    Item.folio.S as folio,
    Item.montoTotal.N as monto_total,
    Item.notasCD.L as notas_cd,
    Item.origen.S as origen,
    Item.pgcDataHash.S as pgc_data_hash,
    Item.razonSocial.S as razon_social
FROM "prod-dynamo"."ddb_ygg_dte_recibidos"
LIMIT 100