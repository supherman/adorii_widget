class AdoriiWidget.Views.Sale extends Backbone.View
  className: 'widget-sale'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/sale']

  render: ->
    json = @model.toJSON()
    _.extend json, { namespace: @options.namespace }
    @$el.html @template(json)
    @
