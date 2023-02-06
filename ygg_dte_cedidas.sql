CREATE TABLE "prod-dynamo"."ygg_alta_dte_cedidas" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_dte_cedidas/'
) AS
SELECT 
    Item.cesionarioRut.N as cesionario_rut,
    Item.cedenteRut_folio_tipo.S as cedente_rut_folio_tipo,
    Item.cedente.M.email.S as cedente_email,
    Item.cedente.M.razonSocial.S as cedente_razon_social,
    Item.cedente.M.rut.N as cedente_rut,
    Item.cesionario.M.email.S as cesionario_email,
    Item.cesionario.M.razonSocial.S as cesionario_razon_social,
    Item.cesionario.M.rut.N as cesionario_rut2,
    Item.cesionarioRut_estado.S as cesionario_rut_estado,
    Item.cesionarioRut_estado_folio.S as cesionario_rut_estado_folio,
    Item.cesionarioRut_folio.S as cesionario_rut_folio,
    Item.deudor.M.rut.N as deudor_rut,
    Item.empresaRut.N as empresa_rut,
    Item.estado.S as estado,
    Item.estadoNombre.S as estado_nombre,
    CAST(From_iso8601_timestamp(Item.fechaCesion.S) AS timestamp) as fecha_cesion,
    CAST(From_iso8601_timestamp(Item.fechaCreacion.S) AS timestamp) as fecha_creacion,
    CAST (Item.fechaEmision.S as DATE) as fecha_emision,
    CAST(From_iso8601_timestamp(Item.fechaModificacion.S) AS timestamp) as fecha_modificacion,
    CAST (Item.fechaVencimiento.S  as DATE) as fecha_vencimiento,
    Item.folio.N as folio,
    Item.montoCesion.N as monto_cesion,
    Item.montoTotal.N as monto_total,
    Item.tipoCesion.S as tipo_cesion,
    Item.tipoDte.N as tipo_dte,
    Item.tipoDteNombre.S as tipo_dte_nombre,
    Item.vendedorRut.N as vendedor_rut
FROM "prod-dynamo"."ddb_ygg_dte_cedidas";
