@EndUserText.label: 'BookingSuppl Proj View for Draft RefScen'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true

define view entity /DMO/C_BookingSupplement_A_D
  as projection on /DMO/I_BookingSupplement_D
{
  key BookSupplUUID,

      TravelUUID,

      BookingUUID,

      @Search.defaultSearchElement: true
      BookingSupplementID,

      @ObjectModel.text.element: ['SupplementDescription']
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_SUPPLEMENT', element: 'SupplementID' } ,
                     additionalBinding: [ { localElement: 'BookSupplPrice',  element: 'Price', usage: #RESULT },
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }] }]
      SupplementID,
      _SupplementText.Description as SupplementDescription : localized,

      BookSupplPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,

      LocalLastChangedAt,

      /* Associations */
      _Booking : redirected to parent /DMO/C_Booking_A_D,
      _Product,
      _SupplementText,
      _Travel  : redirected to /DMO/C_Travel_A_D
}
