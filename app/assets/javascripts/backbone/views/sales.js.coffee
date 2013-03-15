class AdoriiWidget.Views.Sales extends Backbone.View
  className: 'sale-list'

  tagName: 'div'

  template: HandlebarsTemplates['backbone/templates/sales']

  render: ->
    @$el.html(@template())
    @addAll()
    @

  addAll: ->
    @collection.chain().slice(0, @options.limit).each @addOne, @

  addOne: (sale)->
    view = new AdoriiWidget.Views.Sale({ model: sale, namespace: @options.namespace })
    @$el.find('ul').append(view.render().el)
