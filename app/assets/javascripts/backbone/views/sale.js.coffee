class AdoriiWidget.Views.Sale extends Backbone.View
  className: 'widget-sale'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/sale']

  initialize: ->
    @$el.addClass "#{@options.namespace}-#{@model.get('CategoryID')}"

  render: ->
    json = @model.toJSON()
    time = moment(json.DisplayEndDate, "MMDDYYYY").fromNow()
    _.extend json, { namespace: @options.namespace, DisplayEndDate: time }
    @$el.html @template(json)
    @
