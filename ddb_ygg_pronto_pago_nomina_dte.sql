CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_pronto_pago_nomina_dte ( 
    Item struct<
        empRut_timestamp:struct<S:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        detalle:struct<M:struct<
            emisorRazonSocial:struct<S:string>,
            emisorRut:struct<N:string>,
            fechas:struct<M:struct<
                emision:struct<S:string>,
                pago:struct<S:string>,
                recepcion:struct<S:string>
            >>,
            folio:struct<N:string>,
            montos:struct<M:struct<
                iva:struct<N:string>,
                total:struct<N:string>
            >>,
            receptorRazonSocial:struct<S:string>,
            receptorRut:struct<N:string>,
            tipoDte:struct<N:string>
        >>,
        estado:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/DynamoDB/ygg-pronto-pago-nomina-dte/AWSDynamoDB/01673531388126-3124d2bc/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
