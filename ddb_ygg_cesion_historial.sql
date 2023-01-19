CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_cesion_historial ( 
    Item struct<
        empRut:struct<N:string>,
        timestamp:struct<N:string>,
        detalle:struct<M:struct<
            cesionario:struct<M:struct<
                email:struct<S:string>,
                razonSocial:struct<S:string>,
                rut:struct<N:string>
            >>,
            emisorRut:struct<N:string>,
            folio:struct<N:string>,
            montoCesion:struct<N:string>,
            tipoDte:struct<N:string>
        >>, 
        emisorRut_folio_tipoDte:struct<S:string>,
        usuarioId:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-cesion-historial/AWSDynamoDB/01673794852982-eebf8343/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');

