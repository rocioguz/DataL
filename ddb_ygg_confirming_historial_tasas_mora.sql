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
LOCATION 's3://destination-guou-bucket-master/DynamoDB/ygg-confirming-historial-tasas-mora/AWSDynamoDB/01673531366501-fcdd8c1e/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
