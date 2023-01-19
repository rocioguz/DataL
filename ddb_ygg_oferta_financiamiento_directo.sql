CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_oferta_financiamiento_directo ( 
    Item struct<
        empRut:struct<N:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        detalle:struct<M:struct<
            emisorRazonSocial:struct<S:string>,
            emisorRut:struct<N:string>,
            fechas:struct<M:struct<
                emision:struct<S:string>,
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
        disponible:struct<BOOL:string>,
        empRut_disponible:struct<S:string>,
        empRut_disponible_receptorRut:struct<S:string>,
        expired_at:struct<N:string>,
        fechaActualizacion:struct<S:string>,
        fechaCreacion:struct<S:string>,
        fechaEmision:struct<S:string>,
        folio:struct<S:string>,
        receptorRazonSocial:struct<S:string>,
        receptorRut:struct<S:string>,
        rutaXml:struct<S:string>,
        tipo:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-oferta-financiamiento-directo/AWSDynamoDB/01673794854108-a4e606c4/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');

