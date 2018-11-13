class Api::V1::DecksController < ApplicationController
  # before_action :find_deck, only: [:delete]

  def delete
    params.permit(:id)
    @deck = Deck.find(params[:id])

    if @deck.valid?
      @deck.delete
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    else
      render json: {error: 'failed to create deck'}, status: :not_acceptable
    end
  end

  def edit
    params.permit(:deck, :id, :name)
    params.permit(cards: [:name, :artist, :flavor, :imageUrl, :manaCost, :originalType, :setName, :text, :cmc])
    @deck = Deck.find(params[:id])
    @cards_array = []
    params[:cards].each do |card|
      newCard = Card.find_or_create_by({
        name: card[:name],
        artist: card[:artist],
        flavor: card[:flavor],
        imageUrl: card[:imageUrl],
        manaCost: card[:manaCost],
        originalType: card[:originalType],
        setName: card[:setName],
        text: card[:text],
        cmc: card[:cmc]})
      @cards_array.push(newCard)
    end

    @deck.update(cards: @cards_array, name: params[:name])

    if @deck.valid?
      current_user.decks.push(@deck)
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    else
      render json: {error: 'failed to create deck'}, status: :not_acceptable
    end

  end

  def create
    @deck = Deck.create({name: deck_params[:name], user_id: current_user.id})
    params.permit(cards: [:name, :artist, :flavor, :imageUrl, :manaCost, :originalType, :setName, :text])

    params[:cards].each do |card|
      newCard = Card.find_or_create_by({
        name: card[:name],
        artist: card[:artist],
        flavor: card[:flavor],
        imageUrl: card[:imageUrl],
        manaCost: card[:manaCost],
        originalType: card[:originalType],
        setName: card[:setName],
        text: card[:text]})
      @deck.cards.push(newCard)
    end

    if @deck.valid?
      current_user.decks.push(@deck)
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    else
      render json: {error: 'failed to create deck'}, status: :not_acceptable
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:name, :cards)
  end

  def card_params
    params.permit(:cards => [:name])
  end

  def find_deck
    @deck = Deck.find(params[:id])
  end
end
