class CreditCardsController < ApplicationController
  before_action :authenticate_user!

  require "payjp"

  def new
    @card = CreditCard.new
    card = CreditCard.where(id: params[current_user.id])
    redirect_to credit_card_path if card.exists?
  end
  
  def edit
  end
  
  def pay
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    @card = CreditCard.find_by(user_id: current_user.id)
    @product.update(buyer_id: current_user.id)
    Payjp::Charge.create(
      :amount => @product.price, 
      :customer => @card.customer_id,
      :currency => 'jpy',
    )
    redirect_to purchase_products_path(@product.id)
  end

  def create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        flash[:notice] = 'クレジットカードを登録しました'
        redirect_to  root_path
      else
        flase[:alert] = 'クレジットカードが正しく登録できませんでした'
        render :create
      end
    end
  end

  def delete
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
  end

  def show
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
