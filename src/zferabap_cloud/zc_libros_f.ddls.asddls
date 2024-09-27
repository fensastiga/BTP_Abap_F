@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true             //Delegar las anotaciones semanticas en otro objeto
define view entity zc_libros_f as select from ztb_libros_f as Libros
    inner join ztb_catego as Categorias on Libros.bi_categ = Categorias.bi_categ
    left outer join zc_clnts_lib_f as Ventas on Libros.id_libro = Ventas.IdLibro
    association [0..*] to zc_clientes_f as _Clientes on $projection.IdLibro = _Clientes.IdLibro
                                           //Tambien indicar la delegación en el cds de la asociacion
{
    key Libros.id_libro as IdLibro,
        Libros.titulo as Titulo,
        Libros.bi_categ as Categoria,
        Libros.autor as Autor,
        Libros.editorial as Editorial,
        Libros.idioma as Idioma,
        Libros.paginas as Paginas,
        @Semantics.amount.currencyCode: 'Moneda'
        @EndUserText.label: 'Precio Base'
        Libros.precio as Precio,
        Libros.moneda as Moneda,
        case
            when Ventas.Ventas < 1 then 0
            when Ventas.Ventas = 1 then 1
            when Ventas.Ventas = 2 then 2
            when Ventas.Ventas > 2 then 3                        
        end as Ventas,
        Categorias.descripcion as Descripcion,
        Libros.formato as Formato,
        Libros.url as imagen,
        _Clientes
    
}
