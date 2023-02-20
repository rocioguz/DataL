CREATE TABLE "prod-dynamo"."ygg_oferta_financiamiento_cedidas" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_oferta_financiamiento_cedidas/'
) AS
SELECT 
    CAST (Item.cesionarioRut.N as int) as cesionario_rut,
    Item.cedenteRut_folio_tipo.S as cedente_rut_folio_tipo,
    Item.cedente.M.email.S as cedente_email,
    Item.cedente.M.razonSocial.S as cedente_razon_social,
    CAST (Item.cedente.M.rut.N as int) as cedente_rut,
    Item.cesionario.M.email.S as cesionario_email,
    Item.cesionario.M.razonSocial.S as cesionario_razon_social,
    CAST (Item.cesionario.M.rut.N as int) as cesionario_rut2,
    Item.cesionarioRut_folio.S as cesionario_rut_folio,
    CAST (Item.deudor.M.rut.N as int) as deudor_rut,
    CAST (Item.empresaRut.N as int) as empresa_rut,
    Item.estado.S as estado,
    Item.estadoNombre.S as estado_nombre,
    Item.estadoSimulacion.S as estado_simulacion,
    CAST (Item.expired_at.N as int) as expired_at,
    CAST(From_iso8601_timestamp(Item.fechaCesion.S) AS timestamp) as fecha_cesion,
    CAST(From_iso8601_timestamp(Item.fechaCreacion.S) AS timestamp) as fecha_creacion,
    CAST (Item.fechaEmision.S as DATE) as fecha_emision,
    CAST(From_iso8601_timestamp(Item.fechaModificacion.S) AS timestamp) as fecha_modificacion,
    CAST (Item.fechaVencimiento.S  as DATE) as fecha_vencimiento,
    CAST (Item.folio.N as int) as folio,
    CAST (Item.montoCesion.N as bigint) as monto_cesion,
    CAST (Item.montoTotal.N as bigint) as monto_total,
    Item.tipoCesion.S as tipo_cesion,
    CAST (Item.tipoDte.N as int) as tipo_dte,
    Item.tipoDteNombre.S as tipo_dte_nombre,
    CAST (Item.vendedorRut.N as int) as vendedor_rut
FROM "prod-dynamo"."ddb_ygg_oferta_financiamiento_cedidas";
