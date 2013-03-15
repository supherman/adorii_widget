class AdoriiWidget.Views.SaleDetail extends Backbone.View
  className: 'sale-list'

  tagName: 'div'

  template: HandlebarsTemplates['backbone/templates/sale_detail']

  render: ->
    @$el.html(@template())
    @addAll()
    @

  addAll: ->
    @collection.each @addOne, @

  addOne: (product)->
    view = new AdoriiWidget.Views.SaleProduct({ model: product })
    @$el.find('ul').append(view.render().el)
