CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_oferta_financiamiento_pronto_pago ( 
    Item struct<
        receptorRut:struct<N:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-oferta-financiamiento-pronto-pago/AWSDynamoDB/01673794854194-8fb33883/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');