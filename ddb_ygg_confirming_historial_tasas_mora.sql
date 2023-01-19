CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_confirming_historial_tasas_mora ( 
    Item struct<
        empRut:struct<N:string>,
        fechaCreacion:struct<S:string>,
        fechaModificacion:struct<S:string>,
        tasasMora:struct<M:struct<
            financiamientoDirecto:struct<N:string>
        >>
        
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-confirming-historial-tasas-mora/AWSDynamoDB/01673794853171-f377104d/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');