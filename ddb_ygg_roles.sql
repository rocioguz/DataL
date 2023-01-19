CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_roles ( 
    Item struct<
        id:struct<S:string>,
        empRut:struct<N:string>,
        nombre:struct<S:string>,
        permisos:struct<SS:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-roles/AWSDynamoDB/01673794854451-fae2a12c/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');