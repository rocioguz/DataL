SELECT
    Item.empRut.N as emp_rut,
    CAST(From_iso8601_timestamp(Item.fechaCreacion.S) AS timestamp) as fecha_creacion,
    CAST(From_iso8601_timestamp(Item.fechaModificacion.S) AS timestamp) as fecha_modificacion,
    Item.tasasMora.M.financiamientoDirecto.N as tasas_mora_financiamiento_directo
FROM "prod-dynamo"."ddb_ygg_confirming_historial_tasas_mora";