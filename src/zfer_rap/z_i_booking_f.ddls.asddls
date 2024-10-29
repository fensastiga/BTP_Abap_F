@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_I_BOOKING_F
 as projection on z_r_booking_f
{
    key BookingUUID,
    TravelUUID,
    BookingID,
    BookingDate,
    CustomerID,
    AirlineID,
    ConnectionID,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true    
    LocalLastChangedAt,
    /* Associations */
    _BookingSupplement :  redirected to composition child Z_I_BOOK_SUPPL_F,
    _BookingStatus,
    _Carrier,
    _Connection,
    _Customer,
    _Travel : redirected to parent Z_I_TRAVEL_F
    
}
