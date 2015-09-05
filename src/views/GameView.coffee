class window.GameView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').playerHit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'bust': -> 
      console.log "You Busted"
      return
    

  initialize: ->
    @playerHand = new HandView(collection: @model.get 'playerHand')
    @dealerHand = new HandView(collection: @model.get 'dealerHand')
    @playerHand.collection.on 'bust', -> console.log "Game View heard the bust event."
    @render()
    return

  dealerTurn: ->
    @$('.hit-button').detach()
    @$('.stand-button').detach()


    #remove 'hit' and 'stand' buttons from the view
    #iterate through dealers turns until he stops
    #calculate score and end game.  Display new game button.

  bustMode: ->
    


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html @playerHand.el
    @$('.dealer-hand-container').html @dealerHand.el
