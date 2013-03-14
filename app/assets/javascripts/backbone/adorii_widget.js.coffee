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

$.fn.adoriiWidget = (options)->
  defaults =
    limit: 10

  _.extend(options, defaults)

  products = new AdoriiWidget.Collections.Products()
  products.url = options.url
  products.fetch()
  products.on 'reset', =>

    @each ->
      view = new AdoriiWidget.Views.Products({ collection: products, limit: options.limit })
      $(@).html(view.render().el)
