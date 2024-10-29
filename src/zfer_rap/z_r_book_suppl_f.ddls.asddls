@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppleme - Root'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z_r_book_suppl_f
  as select from zbksppl_f
  //Relacionar con el Padre
  association to parent z_r_booking_f as _Booking  on $projection.BookingUUID = _Booking.BookingUUID
  //Relacionar con el Abuelo
  association [1..1] to z_r_travel_f as _Travel on $projection.TravelUUID = _Travel.TravelUUID
  
  association [1..1] to /DMO/I_Supplement as _Product on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key booksuppl_uuid        as BookSupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as BookSupplPrice,
      currency_code         as CurrencyCode,
      //eTag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      //Publicar
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
