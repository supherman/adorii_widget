class AdoriiWidget.Views.SaleProduct extends Backbone.View
  className: 'widget-sale'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/sale_product']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
