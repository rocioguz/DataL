CREATE TABLE "prod-dynamo"."ygg_empresas" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_empresas/'
) AS
SELECT CAST (Item.rut.N as int) as rut,
  CAST (Item.activo.N as int) as activo,
  Item.altaLegal.M.estado.S as alta_legal_estado,
  CAST (Item.altaLegal.M.pgcId.N as int) as alta_legal_pgc_id,
  Item.caracteristicasContribuyentes.L as caracteristicas_contribuyentes,
  Item.cuentasBancarias.L as cuentas_bancarias,
  CAST (Item.empresaUnDia.BOOL as boolean) as empresa_un_dia,
  CAST(
    from_iso8601_timestamp(Item.fechaCreacion.S) AS timestamp
  ) as fecha_creacion,
  CAST(
    from_iso8601_timestamp(Item.fechaModificacion.S) AS timestamp
  ) as fecha_modificacion,
  Item.flujoLegal.M.estado.S as flujo_legal_estado,
  CAST (Item.jsonLegalBot.M.auth.BOOL as boolean) as json_legal_bot_auth,
  Item.jsonLegalBot.M.data.M.estado.M.rut.S as json_legal_bot_data_estado_rut,
  Item.jsonLegalBot.M.data.M.estado.M.ejecutivo.S as json_legal_bot_data_estado_ejecutivo,
  Item.jsonLegalBot.M.data.M.estado.M.estado.S as json_legal_bot_data_estado_estado,
  Item.jsonLegalBot.M.data.M.estado.M.fecha.S as json_legal_bot_data_estado_fecha,
  CAST (Item.jsonLegalBot.M.data.M.estado.M.id.N as int) as json_legal_bot_data_estado_id,
  Item.jsonLegalBot.M.data.M.estado.M.preEstudio.S as json_legal_bot_data_estado_preEstudio,
  Item.jsonLegalBot.M.data.M.estado.M.razonSocial.S as json_legal_bot_data_estado_razon_social,
  Item.jsonLegalBot.M.data.M.estudio.M.rut.S as json_legal_bot_data_estudio_rut,
  Item.jsonLegalBot.M.data.M.estudio.M.customer.S as json_legal_bot_data_estudio_customer,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.disuelto.BOOL as boolean
  ) as json_legal_bot_data_estudio_disuelto,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.errorExtraccion.BOOL as boolean
  ) as json_legal_bot_data_estudio_error_extraccion,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.errorFatal.BOOL as boolean
  ) as json_legal_bot_data_estudio_error_fatal,
  Item.jsonLegalBot.M.data.M.estudio.M.fechaCambioAdministracion.S as json_legal_bot_data_estudio_fecha_cambio_administracion,
  Item.jsonLegalBot.M.data.M.estudio.M.fechaEstudio.S as json_legal_bot_data_estudio_fecha_estudio,
  Item.jsonLegalBot.M.data.M.estudio.M.mensajes.L as json_legal_bot_data_estudio_mensajes,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.modificado.BOOL as boolean
  ) as json_legal_bot_data_estudio_modificado,
  Item.jsonLegalBot.M.data.M.estudio.M.penta.M.rut.S as json_legal_bot_data_estudio_penta_rut,
  Item.jsonLegalBot.M.data.M.estudio.M.penta.M.administradores.L as json_legal_bot_data_estudio_penta_administradores,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.penta.M.algunaEncontrada.BOOL as boolean
  ) as json_legal_bot_data_estudio_penta_alguna_encontrada,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.penta.M.disuelto.BOOL as boolean
  ) as json_legal_bot_data_estudio_penta_disuelto,
  Item.jsonLegalBot.M.data.M.estudio.M.penta.M.facultades.L as json_legal_bot_data_estudio_penta_facultades,
  Item.jsonLegalBot.M.data.M.estudio.M.penta.M.matrizProductos.L as json_legal_bot_data_estudio_penta_matriz_productos,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.penta.M.preAprobado.BOOL as boolean
  ) as json_legal_bot_data_estudio_penta_preaprobado,
  Item.jsonLegalBot.M.data.M.estudio.M.penta.M.razonSocial.S as json_legal_bot_data_estudio_penta_razon_social,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.preAprobado.BOOL as boolean
  ) as json_legal_bot_data_estudio_preaprobado,
  Item.jsonLegalBot.M.data.M.estudio.M.prestudios.L as json_legal_bot_data_estudio_prestudios,
  Item.jsonLegalBot.M.data.M.estudio.M.tipoSociedad.S as json_legal_bot_data_estudio_tipo_sociedad,
  CAST (
    Item.jsonLegalBot.M.data.M.estudio.M.transformado.BOOL as boolean
  ) as json_legal_bot_data_estudio_transformado,
  Item.jsonLegalBot.M.data.M.estudio.M.ultimaModificacion.S as json_legal_bot_data_estudio_ultima_modificacion,
  CAST (Item.jsonLegalBot.M.data.M.id.N as int) as json_legal_bot_data_id,
  CAST (Item.jsonLegalBot.M.data.M.ok.BOOL as boolean) as json_legal_bot_data_ok,
  Item.jsonLegalBot.M.mensaje.S as json_legal_bot_mensaje,
  CAST (Item.jsonLegalBot.M.ok.BOOL as boolean) as json_legal_bot_ok,
  Item.listadoRepresentantesLegales.L as listado_representantes_legales,
  Item.nombreFantasia.S as nombre_fantasia,
  Item.procesosAutenticacion.M.estado.S as procesos_autenticacion_estado,
  CAST(
    from_iso8601_timestamp(Item.procesosAutenticacion.M.procesoFin.S) AS timestamp
  ) as procesos_autenticacion_proceso_fin,
  CAST(
    from_iso8601_timestamp(Item.procesosAutenticacion.M.procesoInicio.S) AS timestamp
  ) as procesos_autenticacion_proceso_inicio,
  Item.procesosCarpetaTributaria.M.estado.S as procesos_carpeta_tributaria_estado,
  CAST(
    from_iso8601_timestamp(Item.procesosCarpetaTributaria.M.procesoFin.S) AS timestamp
  ) as procesos_carpeta_tributaria_proceso_fin,
  CAST(
    from_iso8601_timestamp(Item.procesosCarpetaTributaria.M.procesoInicio.S) AS timestamp
  ) as procesos_carpeta_tributaria_proceso_inicio,
  Item.procesosExtraccionCesion.M.estado.S as procesos_extraccion_cesion_estado,
  CAST(
    from_iso8601_timestamp(Item.procesosExtraccionCesion.M.procesoFin.S) AS timestamp
  ) as procesos_extraccion_cesion_proceso_fin,
  CAST(
    from_iso8601_timestamp(Item.procesosExtraccionCesion.M.procesoInicio.S) AS timestamp
  ) as procesos_extraccion_cesion_proceso_inicio,
  Item.procesosExtraccionDte.M.estado.S as procesos_extraccion_dte_estado,
  CAST(
    from_iso8601_timestamp(Item.procesosExtraccionDte.M.procesoFin.S) AS timestamp
  ) as procesos_extraccion_dte_proceso_fin,
  CAST(
    from_iso8601_timestamp(Item.procesosExtraccionDte.M.procesoInicio.S) AS timestamp
  ) as procesos_extraccion_dte_proceso_inicio,
  Item.razonSocial.S as razon_social,
  CAST (Item.representanteLegal.M.rut.N as int) as representante_legal_rut,
  Item.representanteLegal.M.fechaCreacion.S as representante_legal_fecha_creacion,
  Item.representanteLegal.M.nombre.S as representante_legal_nombre,
  Item.representanteLegal.M.rutaCertificado.S as representante_legal_ruta_certificado,
  Item.representanteLegal.M.siiPassword.S as representante_legal_sii_password,
  Item.representanteLegal.M.usuarioCreacion.S as representante_legal_usuario_creacion,
  CAST (
    Item.representanteLegal.M.vigente.BOOL as boolean
  ) as representante_legal_vigente,
  Item.siiPassword.S as sii_password,
  Item.usuarios.M as usuarios
FROM "prod-dynamo"."ddb_ygg_empresas";
