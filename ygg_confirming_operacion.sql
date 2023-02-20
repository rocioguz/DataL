CREATE TABLE "prod-dynamo"."ygg_confirming_operacion" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_confirming_operacion/'
) AS
SELECT CAST (Item.empRut.N as int) as emp_rut,
  CAST (Item.pgcId.N as int) as pgc_id,
  Item.comprobante.L as comprobante,
  Item.detalle.M.clienteRazonSocial.S as detalle_cliente_razon_social,
  CAST (Item.detalle.M.clienteRut.N as int) as detalle_cliente_rut,
  CAST (Item.detalle.M.estado.M.id.N as int) as detalle_estado_id,
  Item.detalle.M.estado.M.nombre.S as detalle_estado_nombre,
  CAST(
    From_iso8601_timestamp(Item.detalle.M.fechas.M.curso.S) AS timestamp
  ) as detalle_fechas_curso,
  CAST(
    From_iso8601_timestamp(Item.detalle.M.fechas.M.ingreso.S) AS timestamp
  ) as detalle_fechas_ingreso,
  CAST(
    From_iso8601_timestamp(Item.detalle.M.fechas.M.termino.S) AS timestamp
  ) as detalle_fechas_termino,
  CAST (Item.detalle.M.montos.M.anticipo.N as int) as detalle_montos_anticipo,
  CAST (Item.detalle.M.montos.M.aplicaciones.N as int) as detalle_montos_aplicaciones,
  CAST (Item.detalle.M.montos.M.comision.N as int) as detalle_montos_comision,
  CAST (
    Item.detalle.M.montos.M.diferenciaPrecio.N as int
  ) as detalle_montos_diferencia_precio,
  CAST (Item.detalle.M.montos.M.excedentes.N as int) as detalle_montos_excedentes,
  CAST (
    Item.detalle.M.montos.M.gestionLegalAdministrativa.N as int
  ) as detalle_montos_gestion_legal_administrativa,
  CAST (Item.detalle.M.montos.M.giro.N as int) as detalle_montos_giro,
  CAST (Item.detalle.M.montos.M.iva.N as int) as detalle_montos_iva,
  CAST (Item.detalle.M.montos.M.mora.N as int) as detalle_montos_mora,
  CAST (Item.detalle.M.montos.M.total.N as int) as detalle_montos_total,
  CAST (Item.detalle.M.saldoCredito.N as int) as detalle_saldo_credito,
  CAST (Item.detalle.M.subProducto.M.id.N as int) as detalle_sub_producto_credito_id,
  Item.detalle.M.subProducto.M.nombre.S as detalle_sub_producto_credito_nombre,
  Item.dtes.L as dtes,
  Item.empRut_fechaSolicitud.S as emp_rut_fecha_solicitud,
  Item.empRut_fechaSolicitud_estado.S as emp_rut_fecha_solicitud_estado,
  Item.empRut_tipoConfirming.S as emp_rut_tipo_confirming,
  Item.empRut_tipoConfirming_estado.S as emp_rut_tipo_confirming_estado,
  CAST (Item.estadoPago.M.idCxCConfirming.N as int) as estado_pago_id_CxC_Confirming,
  CAST (Item.estadoPago.M.monto.N as int) as estado_pago_monto,
  CAST (Item.estadoPago.M.montoPendiente.N as int) as estado_pago_monto_pendiente,
  CAST (Item.estadoPago.M.montoUtilizado.N as int) as estado_pago_monto_utilizado,
  CAST (Item.estadoPago.M.rut.N as int) as estado_pago_rut,
  Item.fechaActualizacion.S as fecha_actualizacion,
  Item.fechaSolicitud.S as fecha_solicitud,
  --From_iso8601_timestamp(Item.fechaActualizacion.S) as t1,
  --CAST(From_iso8601_timestamp(Item.fechaActualizacion.S) AS timestamp) as fecha_actualizacion,
  --CAST(From_iso8601_timestamp(Item.fechaSolicitud.S) AS timestamp) as fecha_solicitud,
  Item.firmantes.L as firmantes,  --falta desglosar
  Item.rutaArchivo.S as ruta_archivo,
  CAST (Item.simId.N as int) as sim_id,
  Item.subOperaciones.M.datos.S as sub_operaciones_datos,  --falta desglosar
  Item.tipoConfirming.S as tipo_confirming
FROM "prod-dynamo"."ddb_ygg_confirming_operacion";
