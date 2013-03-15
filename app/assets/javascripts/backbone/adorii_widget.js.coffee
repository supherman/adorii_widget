#= require handlebars.runtime
#= require backbone_rails_sync
#= require backbone_datalink
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.AdoriiWidget =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  Instances: {}

$.fn.adoriiProductsWidget = (options)->
  defaults =
    limit: 10

  _.defaults(options, defaults)

  products = new AdoriiWidget.Collections.Products()
  products.url = options.url
  products.fetch()
  products.on 'reset', =>

    @each ->
      view = new AdoriiWidget.Views.Products({ collection: products, limit: options.limit })
      $(@).html(view.render().el)

$.fn.adoriiSalesWidget = (options)->
  defaults =
    limit: 10
    namespace: 'sales'

  _.defaults(options, defaults)

  AdoriiWidget.Instances[options.namespace] = new AdoriiWidget.Collections.Sales()
  AdoriiWidget.Instances[options.namespace].url = options.url
  AdoriiWidget.Instances[options.namespace].fetch()
  AdoriiWidget.Instances[options.namespace].on 'reset', =>

    @each ->
      view = new AdoriiWidget.Views.Sales
        collection: AdoriiWidget.Instances[options.namespace]
        limit: options.limit
        namespace: options.namespace
      $(@).html(view.render().el)

    new AdoriiWidget.Routers.Sales({ namespace: options.namespace, el: $(@) })

    Backbone.history.stop()
    Backbone.history.start()
  @
