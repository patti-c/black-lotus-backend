class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def decks
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create({username: params[:username], password: params[:password]})
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user_info: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :deck)
  end

end
