class AdoriiWidget.Views.Product extends Backbone.View
  className: 'widget-product'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/product']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
