CREATE TABLE "prod-dynamo"."ygg_oferta_financiamiento_pronto_pago" WITH (
  format = 'parquet',
  external_location = 's3://staging.layer/DynamoDB/ygg_oferta_financiamiento_pronto_pago/'
) AS
SELECT CAST (Item.empRut.N as int) as emp_rut,
  Item.emisorRut_folio_tipoDte.S as emisor_rut_folio_tipo_dte,
  CAST (Item.disponible.BOOL as boolean) as disponible,
  Item.empRut_disponible.S as emp_rut_disponible,
  Item.empRut_disponible_receptorRut.S as emp_rut_disponible_receptor_rut,
  Item.rutaXml.S as ruta_xml
FROM "prod-dynamo"."ddb_ygg_oferta_financiamiento_pronto_pago";
