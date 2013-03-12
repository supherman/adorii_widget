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
  url = options.url

  products = new AdoriiWidget.Collections.Products()
  products.url = url
  products.fetch()
  products.on 'reset', =>

    @each ->
      view = new AdoriiWidget.Views.Products({ collection: products })
      $(@).html(view.render().el)
