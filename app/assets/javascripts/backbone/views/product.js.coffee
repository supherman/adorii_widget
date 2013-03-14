class AdoriiWidget.Views.Product extends Backbone.View
  className: 'widget-product'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/product']

  render: ->
    json = @model.toJSON()
    time = moment(json.DisplayEndDate, "MMDDYYYY").fromNow()
    _.extend json, { DisplayEndDate: time }
    @$el.html(@template(json))
    @
