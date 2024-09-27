@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true     //Delegar el metadata extención
define view entity zc_clientes_f as select from ztb_clientes as Clientes
    inner join ztb_clnts_lib_f as ClientesLibros on ClientesLibros.id_cliente = Clientes.id_cliente
{
    key ClientesLibros.id_libro as IdLibro,
    key Clientes.id_cliente as IdCliente,
    key Clientes.tipo_acceso as Acceso,
        Clientes.nombre as Nombre,
        Clientes.apellidos as Apellidos,
        Clientes.email as Email,
        Clientes.url as Imagen
}
