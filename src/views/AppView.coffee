class window.AppView extends Backbone.View

  template: _.template '
    <div class="gameView"></div>
  '

  initialize: ->
    @gameview = new GameView(model: new Game())
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    # Do we need a $ to attach this to the DOM?
    #@$('.gameview') wasn't working.  In other classes, the class here was part of a template.  We could create a template here...
    @$('.gameview').html @gameview.$el

