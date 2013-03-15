class AdoriiWidget.Routers.Sales extends Backbone.Router
  routes:
    '': 'index'

  initialize: (options)->
    @namespace  = options.namespace
    @el         = options.el
    @collection = AdoriiWidget.Instances[options.namespace]
    @route "#{@namespace}",     'index'
    @route "#{@namespace}/:id", 'show'

  show: (id)->
    @el.find('ul').hide()
    detail = @el.find('.sale-detail')
    model = @collection.get id
    view  = new AdoriiWidget.Views.SaleDetail({ model: model })
    detail.html(view.render().el)
    detail.show()

  index: ->
    @el.find('.sale-detail').hide()
    @el.find('ul').show()

