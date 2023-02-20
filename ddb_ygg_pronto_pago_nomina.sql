CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_pronto_pago_nomina ( 
    Item struct<
        empRut:struct<N:string>,
        timestamp:struct<N:string>,
        cantidadDtes:struct<N:string>,
        cantidadProveedores:struct<N:string>,
        fechaActualizacion:struct<S:string>,
        fechaCreacion:struct<S:string>,
        montoTotal:struct<N:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/DynamoDB/ygg-pronto-pago-nomina/AWSDynamoDB/01672097418017-9ee4609a/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
