CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_dte_recibidos ( 
    Item struct<
        empRut:struct<N:string>,
        emisorRut_folio_tipoDte:struct<S:string>,
        annoMes_empRut:struct<S:string>,
        annoMes_empRut_hasCesion:struct<S:string>,
        detalle:struct<M:struct<
            emisorRazonSocial:struct<S:string>,
            emisorRut:struct<N:string>,
            eventoReceptor:struct<S:string>,
            eventoReceptorLeyenda:struct<S:string>,
            fechas:struct<M:struct<
                acuse:struct<S:string>,
                emision:struct<S:string>,
                recepcion:struct<S:string>
            >>,
            folio:struct<N:string>,
            montos:struct<M:struct<
                afecto:struct<N:string>,
                exento:struct<N:string>,
                iva:struct<N:string>,
                total:struct<N:string>
            >>,
            porVencer:struct<BOOL:string>,
            receptorRazonSocial:struct<S:string>,
            receptorRut:struct<N:string>,
            tipoDte:struct<N:string>
        >>,
        emisorRut:struct<S:string>,
        empRut_confirming_pago_proveedores_enabled:struct<S:string>,
        empRut_porVencer:struct<S:string>,
        eventoReceptor:struct<S:string>,
        fechaCreacion:struct<S:string>,
        fechaEmision:struct<S:string>,
        fechaModificacion:struct<S:string>,
        folio:struct<S:string>,
        montoTotal:struct<N:string>,
        notasCD:struct<L:array<struct<
            M:struct<
                emisorRazonSocial:struct<S:string>,
                emisorRut:struct<N:string>,
                fechaEmision:struct<S:string>,
                fechaRecepcion:struct<S:string>,
                folio:struct<N:string>,
                montoIva:struct<N:string>,
                montoTotal:struct<N:string>,
                receptorRazonSocial:struct<S:string>,
                tipoDte:struct<N:string>
            >
        >>>,
        origen:struct<S:string>,
        pgcDataHash:struct<S:string>,
        razonSocial:struct<S:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-dte-recibidos/AWSDynamoDB/01673794853654-8ac8d84f/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');
