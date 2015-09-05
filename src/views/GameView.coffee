class window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="new-game">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').playerHit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .new-game':  -> @dealNewCards()

  initialize: ->
    @playerHand = new HandView(collection: @model.get 'playerHand')
    @dealerHand = new HandView(collection: @model.get 'dealerHand')
    @newGameButton = '<button class="new-game">New Game</button>'
    @listenTo @playerHand.collection, 'bust', @dealerTurn
    @render()
    return

  dealerTurn: ->
    console.log "It's the dealers turn"
    @$('.hit-button').detach()
    @$('.stand-button').detach()
    @$el.prepend(@newGameButton)

  dealNewCards: ->
    @model.dealCards()
    @playerHand = new HandView(collection: @model.get 'playerHand')
    @dealerHand = new HandView(collection: @model.get 'dealerHand')
    @render()
    #remove 'hit' and 'stand' buttons from the view
    #iterate through dealers turns until he stops
    #calculate score and end game.  Display new game button.

  bustMode: ->

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html @playerHand.el
    @$('.dealer-hand-container').html @dealerHand.el
    @$('.new-game').remove()
    #console.log @newGameButton
    return
