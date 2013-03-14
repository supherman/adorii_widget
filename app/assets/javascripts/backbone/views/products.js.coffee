class AdoriiWidget.Views.Products extends Backbone.View
  className: 'product-list'

  tagName: 'div'

  template: HandlebarsTemplates['backbone/templates/products']

  render: ->
    @$el.html(@template())
    @addAll()
    @

  addAll: ->
    @collection.chain().slice(0, @options.limit).each @addOne, @

  addOne: (product)->
    view = new AdoriiWidget.Views.Product({ model: product })
    @$el.find('ul').append(view.render().el)
