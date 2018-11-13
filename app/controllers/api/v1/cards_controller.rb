class Api::V1::CardsController < ApplicationController
  before_action :find_card, only: [:show]
  def index
    @cards = Card.all
    render json: @cards
  end

  def show
    render json: @card
  end

  private

  def card_params
    params.permit(:name)
  end

  def find_card
    @card = Card.find(params[:id])
  end
end
