SELECT 
    Item.empRut_timestamp.S as emp_rut_timestamp,
    Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
    Item.detalle.M.emisorRazonSocial.S as detalle_emisor_razon_social,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    CAST (Item.detalle.M.fechas.M.emision.S as DATE) as detalle_fechas_emision,
    CAST (Item.detalle.M.fechas.M.pago.S as DATE) as detalle_fechas_pago,
    CAST(From_iso8601_timestamp(Item.detalle.M.fechas.M.recepcion.S) AS timestamp) as detalle_fechas_recepcion,
    Item.detalle.M.folio.N as detalle_folio,
    Item.detalle.M.montos.M.iva.N as detalle_montos_iva,
    Item.detalle.M.montos.M.total.N as detalle_montos_total,
    Item.detalle.M.receptorRazonSocial.S as detalle_receptor_razon_social,
    Item.detalle.M.receptorRut.N as detalle_receptor_rut,
    Item.detalle.M.tipoDte.N as detalle_tipo_dte,
    Item.estado.S as estado
FROM "prod-dynamo"."ddb_ygg_pronto_pago_nomina_dte";