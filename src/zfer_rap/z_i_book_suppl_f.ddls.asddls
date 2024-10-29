@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppleme - Interface'

define view entity Z_I_BOOK_SUPPL_F as projection on z_r_book_suppl_f
{
    key BookSupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementId,
    SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookSupplPrice,
    CurrencyCode,
    LocalLastChangedAt,
    /* Associations */
    _Booking: redirected to parent Z_I_BOOKING_F,
    _Product,
    _SupplementText,
    _Travel: redirected to Z_I_TRAVEL_F
}
