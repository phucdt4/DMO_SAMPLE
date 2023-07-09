@EndUserText.label: 'Booking Proj View with Draft'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true
@Search.searchable: true
define view entity /DMO/C_Booking_D_D
  as projection on /DMO/I_Booking_D
{
  key BookingUUID,

      TravelUUID,

      @Search.defaultSearchElement: true
      BookingID,

      BookingDate,

      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer', element: 'CustomerID' }}]
      CustomerID,
      _Customer.LastName as CustomerName,

      @ObjectModel.text.element: ['CarrierName']
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
      AirlineID,
      _Carrier.Name      as CarrierName,

      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                     additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                          { localElement: 'AirlineID',    element: 'AirlineID'},
                                          { localElement: 'FlightPrice',  element: 'Price', usage: #RESULT},
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      ConnectionID,

      FlightDate,

      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                     additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                          { localElement: 'AirlineID',    element: 'AirlineID'},
                                          { localElement: 'FlightPrice',  element: 'Price', usage: #RESULT },
                                          { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT } ] } ]
      FlightPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      CurrencyCode,

      BookingStatus,

      LocalLastChangedAt,

      /* Associations */
      _BookingSupplement: redirected to composition child /DMO/C_BookingSupplement_D_D,
      _Carrier,
      _Connection,
      _Customer,
      _Travel: redirected to parent /DMO/C_Travel_D_D
}
