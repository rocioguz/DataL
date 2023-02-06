CREATE TABLE "prod-dynamo"."ygg_financiamiento_operacion" WITH (
  format = 'parquet',
  external_location = 's3://destination-athena-results/ygg_financiamiento_operacion/'
) AS
SELECT 
    Item.empRut.N as emp_rut,
    Item.pgcId.N as pgc_id,
    Item.detalle.M.aprobacionRiesgo.BOOL as detalle_aprobacion_riesgo,
    Item.detalle.M.cantidadDocumentos.N as detalle_cantidad_documentos,
    Item.detalle.M.emisorRut.N as detalle_emisor_rut,
    Item.detalle.M.estado.M.id.N as detalle_estado_id,
    Item.detalle.M.estado.M.nombre.S as detalle_estado_nombre,
    Item.detalle.M.fechaOtorgamiento.S as detalle_fecha_otorgamiento,
    Item.detalle.M.montos.M.anticipo.N as detalle_montos_anticipo,
    Item.detalle.M.montos.M.aplicaciones.N as detalle_montos_aplicaciones,
    Item.detalle.M.montos.M.comision.N as detalle_montos_comision,
    Item.detalle.M.montos.M.diferenciaPrecio.N as detalle_montos_diferencia_precio,
    Item.detalle.M.montos.M.excedentes.N as detalle_montos_excedentes,
    Item.detalle.M.montos.M.gestionLegalAdministrativa.N as detalle_montos_gestion_legal_administrativa,
    Item.detalle.M.montos.M.giro.N as detalle_montos_giro,
    Item.detalle.M.montos.M.iva.N as detalle_montos_iva,
    Item.detalle.M.montos.M.total.N as detalle_montos_total,
    Item.detalle.M.porcentajeAnticipo.N as detalle_porcentaje_anticipo,
    Item.detalle.M.tasa.N as detalle_tasa,
    Item.dtes.L as dtes,
    Item.empRut_estado.S as emp_rut_estado,
    Item.empRut_tipoFinanciamiento.S as emp_rut_tipo_financiamiento,
    Item.empRut_tipoFinanciamiento_estado.S as emp_rut_tipo_financiamiento_estado,
    Item.estadoNombre.S as estado_nombre,
    Item.fechaActualizacion.S as fecha_actualizacion,
    Item.fechaCreacionPGC.S as fecha_creacion_pgc,
    Item.fechaSolicitud.S as fecha_solicitud,
    Item.giro.L as giro, --falta desglosar
    Item.rutaArchivo.S as ruta_archivo,
    Item.simId.N as sim_id,
    Item.tipoFinanciamiento.S as tipo_financiamiento
    
FROM "prod-dynamo"."ddb_ygg_financiamiento_operacion"
--,UNNEST(Item.dtes.L) as t(alto)
order by Item.empRut.N desc
