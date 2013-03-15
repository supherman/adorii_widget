class AdoriiWidget.Routers.Sales extends Backbone.Router
  initialize: (options)->
    @namespace  = options.namespace
    @el         = options.el
    @collection = AdoriiWidget.Instances[options.namespace]
    @route "#{@namespace}",     'index'
    @route "#{@namespace}/:id", 'show'

  show: (id)->
    @index()
    el    = @el.find(".#{@namespace}-#{id} .sale-detail")
    model = @collection.get id
    view  = new AdoriiWidget.Views.SaleDetail({ model: model })
    el.html(view.render().el)
    el.show()

  index: ->
    @el.find('.sale-detail').hide()
