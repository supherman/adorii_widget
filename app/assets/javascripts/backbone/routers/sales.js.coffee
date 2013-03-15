class AdoriiWidget.Routers.Sales extends Backbone.Router
  initialize: (options)->
    @route "#{options.namespace}",     'index'
    @route "#{options.namespace}/:id", 'show'

  show: (id)->
    console.log "show #{id}"

  index: ->
    console.log 'index'

