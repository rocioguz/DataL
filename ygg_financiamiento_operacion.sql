CREATE TABLE "prod-dynamo"."ygg_financiamiento_operacion" WITH (
  format = 'json',
  external_location = 's3://staging.layer/DynamoDB/ygg_financiamiento_operacion/'
) AS
SELECT CAST (Item.empRut.N as int) as emp_rut,
  CAST (Item.pgcId.N as int) as pgc_id,
  CAST (Item.detalle.M.aprobacionRiesgo.BOOL as boolean) as detalle_aprobacion_riesgo,
  CAST (Item.detalle.M.cantidadDocumentos.N as int) as detalle_cantidad_documentos,
  CAST (Item.detalle.M.emisorRut.N as int) as detalle_emisor_rut,
  CAST (Item.detalle.M.estado.M.id.N as int) as detalle_estado_id,
  Item.detalle.M.estado.M.nombre.S as detalle_estado_nombre,
  CAST(
    from_iso8601_timestamp(Item.detalle.M.fechaOtorgamiento.S) AS timestamp
  ) as detalle_fecha_otorgamiento,
  CAST (Item.detalle.M.montos.M.anticipo.N as bigint) as detalle_montos_anticipo,
  CAST (Item.detalle.M.montos.M.aplicaciones.N as bigint) as detalle_montos_aplicaciones,
  CAST (Item.detalle.M.montos.M.comision.N as bigint) as detalle_montos_comision,
  CAST (
    Item.detalle.M.montos.M.diferenciaPrecio.N as bigint
  ) as detalle_montos_diferencia_precio,
  CAST (Item.detalle.M.montos.M.excedentes.N as bigint) as detalle_montos_excedentes,
  CAST (
    Item.detalle.M.montos.M.gestionLegalAdministrativa.N as bigint
  ) as detalle_montos_gestion_legal_administrativa,
  CAST (Item.detalle.M.montos.M.giro.N as bigint) as detalle_montos_giro,
  CAST (Item.detalle.M.montos.M.iva.N as bigint) as detalle_montos_iva,
  CAST (Item.detalle.M.montos.M.total.N as bigint) as detalle_montos_total,
  CAST (Item.detalle.M.porcentajeAnticipo.N as double) as detalle_porcentaje_anticipo,
  CAST (Item.detalle.M.tasa.N as double) as detalle_tasa,
  Item.dtes.L as dtes,
  Item.empRut_estado.S as emp_rut_estado,
  Item.empRut_tipoFinanciamiento.S as emp_rut_tipo_financiamiento,
  Item.empRut_tipoFinanciamiento_estado.S as emp_rut_tipo_financiamiento_estado,
  Item.estadoNombre.S as estado_nombre,
  Item.fechaActualizacion.S as fecha_actualizacion,
  --CAST(from_iso8601_timestamp(Item.fechaActualizacion.S) AS timestamp) as fecha_actualizacion,
  CAST(
    from_iso8601_timestamp(Item.fechaCreacionPGC.S) AS timestamp
  ) as fecha_creacion_pgc,
  CAST(
    from_iso8601_timestamp(Item.fechaSolicitud.S) AS timestamp
  ) as fecha_solicitud,
  Item.giro.L as giro,
  --falta desglosar
  Item.rutaArchivo.S as ruta_archivo,
  CAST (Item.simId.N as int) as sim_id,
  Item.tipoFinanciamiento.S as tipo_financiamiento
FROM "prod-dynamo"."ddb_ygg_financiamiento_operacion" --,UNNEST(Item.dtes.L) as t(alto)
  --order by Item.empRut.N desc
