class AdoriiWidget.Views.Sale extends Backbone.View
  className: 'widget-sale'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/sale']

  initialize: ->
    @$el.addClass "#{@options.namespace}-#{@model.get('CategoryID')}"

  render: ->
    json = @model.toJSON()
    _.extend json, { namespace: @options.namespace }
    @$el.html @template(json)
    @
