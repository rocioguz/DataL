CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_condiciones_comerciales ( 
    Item struct<
        empRut:struct<N:string>,
        financistas:struct<L:array<struct< 
            M:struct<
                fechaCreacion:struct<S:string>,
                fechaModificacion:struct<S:string>,
                financiamientoDirecto:struct<M:struct<
                    escenario:struct<S:string>,
                    tramos:struct<L:array<struct<
                        M:struct<
                        anticipo:struct<N:string>,
                        desde:struct<N:string>,
                        hasta:struct<N:string>,
                        tasa:struct<N:string>
                        >
                    >>>
                >>,
                razonSocial:struct<S:string>,
                rut:struct<N:string>
            >
        >>>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/DynamoDB/ygg-condiciones-comerciales/AWSDynamoDB/01673531364962-a81bb6bf/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
