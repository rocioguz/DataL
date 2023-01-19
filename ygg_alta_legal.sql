SELECT 
    Item.empRut.N as emp_rut,
    Item.pgcId.N as pgc_id,
    CAST(From_iso8601_timestamp(Item.condicionesContrato.M.fechaActualizacion.S) AS timestamp) as condiciones_contrato_fecha_actualizacion,
    CAST(From_iso8601_timestamp(Item.condicionesContrato.M.fechaCreacion.S) AS timestamp) as condiciones_contrato_fecha_creacion,
    Item.condicionesContrato.M.firmantes.L as condiciones_contrato_firmantes,
    Item.condicionesContrato.M.numeroDocumentoIdentidad.S as condiciones_contrato_numero_doc_identidad,
    Item.condicionesContrato.M.pgcSolicitudId.N as condiciones_contrato_pgc_solicitud_id,
    Item.condicionesContrato.M.razonSocial.S as condiciones_contrato_razon_social,
    Item.contratoLink.S as contrato_link,
    Item.documentos.L as documentos,
    Item.estado.S as estado,
    CAST(From_iso8601_timestamp(Item.fechaActualizacion.S) AS timestamp) as fecha_actualizacion,
    CAST(From_iso8601_timestamp(Item.fechaSolicitud.S) AS timestamp) as fecha_solicitud,
    Item.firmantesGrupoContrato.L as firmantes_grupo_contrato,
    Item.observacion.S as observacion,
    Item.producto.SS as producto,
    Item.rol.S as rol
FROM "prod-dynamo"."ddb_ygg_alta_legal_solicitud";