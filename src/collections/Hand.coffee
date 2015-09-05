class window.Hand extends Backbone.Collection
  model: Card

  # Each Hand will have an array for storing cards with rank/suit
  # Is this dealer or not?
  initialize: (array, @deck, @isDealer) ->

    # Grab the last card.
    # What is this.last being called on?********
  playerHit: ->
    @add(@deck.pop())
    console.log @minScore()
    if @minScore() > 21 
      @bust()
    @last()

  dealerHit: ->
    @add(@deck.pop())
    console.log @minScore()
    if @minScore() > 21 
      @bust()
    @last()

    # Checks to see if the hand contains an ace. Memo is the total number of Aces in the hand.
  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

    #If a hand goes over 21, announce a bust.
  bust: ->
    console.log "The Hand Model calls Bust."
    @trigger('bust')
    return

    # Dealer card could be visible, but not revealed. minScore addes the value if the card is revealed.
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # When there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  #stand: ->


