CREATE EXTERNAL TABLE IF NOT EXISTS ddb_ygg_dte_cedidas ( 
    Item struct<
        cesionarioRut:struct<N:string>,
        cedenteRut_folio_tipo:struct<S:string>,
        cedente:struct<M:struct<
            email:struct<S:string>,
            razonSocial:struct<S:string>,
            rut:struct<N:string>
        >>,
        cesionario:struct<M:struct<
            email:struct<S:string>,
            razonSocial:struct<S:string>,
            rut:struct<N:string>
        >>,
        cesionarioRut_estado:struct<S:string>,
        cesionarioRut_estado_folio:struct<S:string>,
        cesionarioRut_folio:struct<S:string>,
        deudor:struct<M:struct<
            rut:struct<N:string>
        >>,
        empresaRut:struct<N:string>,
        estado:struct<S:string>,
        estadoNombre:struct<S:string>,
        fechaCesion:struct<S:string>,
        fechaCreacion:struct<S:string>,
        fechaEmision:struct<S:string>,
        fechaModificacion:struct<S:string>,
        fechaVencimiento:struct<S:string>,
        folio:struct<N:string>,
        montoCesion:struct<N:string>,
        montoTotal:struct<N:string>,
        tipoCesion:struct<S:string>,
        tipoDte:struct<N:string>,
        tipoDteNombre:struct<S:string>,
        vendedorRut:struct<N:string>
    >
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://destination-guou-bucket-master/ygg-dte-cedidas/AWSDynamoDB/01673794853454-851b6fab/data/'
TBLPROPERTIES ( 'has_encrypted_data'='true');