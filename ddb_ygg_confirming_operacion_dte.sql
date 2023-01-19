CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_confirming_operacion_dte ( 
    Item struct<
        empRut:struct<N:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        detalle:struct<M:struct<
            emisorRazonSocial:struct<S:string>,
            emisorRut:struct<N:string>,
            fechas:struct<M:struct<
                emision:struct<S:string>,
                vencimiento:struct<S:string>,
                vencimientoOriginal:struct<S:string>
            >>,
            folio:struct<N:string>,
            montos:struct<M:struct<
                anticipo:struct<N:string>,
                diferenciaPrecio:struct<N:string>,
                excedentes:struct<N:string>,
                giro:struct<N:string>,
                total:struct<N:string>
            >>,
            pgcId:struct<N:string>,
            receptorRazonSocial:struct<S:string>,
            receptorRut:struct<N:string>,
            simId:struct<N:string>,
            tipoConfirming:struct<S:string>,
            tipoDte:struct<N:string>
        >>,
        emisorRazonSocial:struct<S:string>,
        emisorRut:struct<N:string>,
        empRut_emisorRut:struct<S:string>,
        empRut_hasRecaudacion:struct<S:string>,
        empRut_tipoConfirming:struct<S:string>,
        fechaVencimiento:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-confirming-operacion-dte/AWSDynamoDB/01673794853357-c121b0c2/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');