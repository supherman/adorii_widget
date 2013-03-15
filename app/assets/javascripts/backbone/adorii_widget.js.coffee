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

  sales = new AdoriiWidget.Collections.Sales()
  sales.url = options.url
  sales.fetch()
  sales.on 'reset', =>

    @each ->
      view = new AdoriiWidget.Views.Sales({ collection: sales, limit: options.limit, namespace: options.namespace })
      $(@).html(view.render().el)

  window.router = new AdoriiWidget.Routers.Sales({ namespace: options.namespace })
  Backbone.history.stop()
  Backbone.history.start()
  @
