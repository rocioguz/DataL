CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_oferta_financiamiento_pronto_pago ( 
    Item struct<
        empRut:struct<N:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        disponible:struct<BOOL:string>,
        empRut_disponible:struct<S:string>,
        empRut_disponible_receptorRut:struct<S:string>,
        rutaXml:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/DynamoDB/ygg-oferta-financiamiento-pronto-pago/AWSDynamoDB/01672097417970-90dbdac8/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
