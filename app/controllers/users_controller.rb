class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :logout]

  def new
  end

  def show 
    @user = User.find(params[:id])
    if @user.credit_card.present?
      @card = CreditCard.find_by(user_id: current_user)
    end
  end

  def destroy
  end

  def logout
  end
end
