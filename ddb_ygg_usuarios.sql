CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_usuarios ( 
    Item struct<
        correo:struct<S:string>,
        activo:struct<N:string>,
        apellidos:struct<S:string>,
        cognitoId:struct<S:string>,
        empresas:struct<NS:string>,
        fechaCreacion:struct<S:string>,
        fechaModificacion:struct<S:string>,
        nombres:struct<S:string>,
        soporte:struct<BOOL:string>,
        telefono:struct<S:string>,
        tyc:struct<M:struct<
            fechaAceptacion:struct<S:string>,
            fechaModificacion:struct<S:string>,
            version:struct<S:string>
        >>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-usuarios/AWSDynamoDB/01673794854534-bda154b7/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');