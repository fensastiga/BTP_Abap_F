@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Z_I_TRAVEL_F 
provider contract transactional_interface
as projection on z_r_travel_f
{
    key TravelUUID,
    TravelID,
    AgencyID,
    CustomerID,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child Z_I_BOOKING_F,
    _Currency,
    _Customer,
    _OverallStatus
}
