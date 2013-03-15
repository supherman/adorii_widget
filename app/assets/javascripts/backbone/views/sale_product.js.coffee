class AdoriiWidget.Views.SaleProduct extends Backbone.View
  className: 'widget-sale'

  tagName: 'li'

  template: HandlebarsTemplates['backbone/templates/sale_product']

  render: ->
    json = @model.toJSON()
    time = moment(json.DisplayEndDate, "MMDDYYYY").fromNow()
    _.extend json, { DisplayEndDate: time }
    @$el.html(@template(json))
    @
