class AdoriiWidget.Views.SaleDetail extends Backbone.View
  className: 'sale-list'

  tagName: 'div'

  template: HandlebarsTemplates['backbone/templates/sale_detail']

  initialize: ->
    @collection = new AdoriiWidget.Collections.Products(@model.get('products'))

  render: ->
    @$el.html @template(@model.toJSON())
    @addAll()
    @

  addAll: ->
    @collection.each @addOne, @

  addOne: (product)->
    view = new AdoriiWidget.Views.SaleProduct({ model: product })
    @$el.find('ul').append(view.render().el)
