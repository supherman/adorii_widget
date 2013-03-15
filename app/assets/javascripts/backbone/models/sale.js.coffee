class AdoriiWidget.Models.Sale extends Backbone.Model
  idAttribute: 'CategoryID'

class AdoriiWidget.Collections.Sales extends Backbone.Collection
  model: AdoriiWidget.Models.Sale
