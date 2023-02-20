CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_oferta_confirming_pago_financiamiento ( 
    Item struct<
        empRut:struct<N:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        detalle:struct<M:struct<
            emisorRazonSocial:struct<S:string>,
            emisorRut:struct<N:string>,
            fechas:struct<M:struct<
                emision:struct<S:string>,
                pago:struct<S:string>
            >>,
            financiamientoOpId:struct<M:struct<
                empRut:struct<N:string>,
                pgcId:struct<N:string>
            >>,
            folio:struct<N:string>,
            montos:struct<M:struct<
                total:struct<N:string>
            >>,
            receptorRazonSocial:struct<S:string>,
            receptorRut:struct<N:string>,
            tipoDte:struct<N:string>
        >>,
        disponible:struct<BOOL:string>,
        empRut_disponible:struct<S:string>,
        expired_at:struct<N:string>,
        fechaActualizacion:struct<S:string>,
        fechaCreacion:struct<S:string>,
        fechaPago:struct<S:string>,
        tipoFinanciamiento:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/DynamoDB/ygg-oferta-confirming-pago-financiamiento/AWSDynamoDB/01672097417796-595da050/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
