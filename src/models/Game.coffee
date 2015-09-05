class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', @deck = new Deck()
    @set 'playerHand', @deck.dealPlayer()
    @set 'dealerHand', @deck.dealDealer()
    console.log @get('playerHand')
    @get('playerHand').on 'bust', console.log "Busted!"

  dealCards: ->
    debugger
    @set 'playerHand', @deck.dealPlayer()
    @set 'dealerHand', @deck.dealDealer()

