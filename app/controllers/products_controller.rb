class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :find_product, only: [:show, :edit, :update, :purchase, :destroy]
  before_action :adimn_seller, only: [:edit, :destroy]

  def index
    @products = Product.includes(:photos).order(created_at: :desc).limit(5)
  end

  def new
    @product = Product.new
    @parents = Category.where(ancestry: nil).order(id: "ASC")
    @photos =  @product.photos.build
    @brand = @product.build_brand
  end

  def show
  end
  
  def update
  end

  def destroy
  end

  def create
    @product = Product.new(product_params)
    unless @product.brand.valid?
      @product.brand.destroy
    end
    unless @product.valid?
      flash.now[:alert] = @product.errors.full_messages
      @parents = Category.where(ancestry: nil).order(id: "ASC")
      @photos =  @product.photos.build
      @brand = @product.build_brand
      render :new and return
    end
    @product.save
    redirect_to user_path(current_user)
  end

  def edit
    @product = Product.find(params[:id])
    @parents = Category.where(ancestry: nil).order(id: "ASC")
    @grandchild = Category.find(@product.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
    @grandchildren = @child.children
    @children = @parent.children
    @prev_images = @product.photos.order(created_at: "ASC")
    @photos =  @product.photos.build
    @brand_name = @product.brand.name
    @brand = @product.build_brand
  end

  def search_category_children
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  def search_category_grandchildren
    respond_to do |format|
      format.html
      format.json do
        @grandchildren = Category.find(params[:child_id]).children
      end
    end
  end

  def purchase
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @card = CreditCard.find_by(user_id: current_user)
    if @card.blank?
      redirect_to new_credit_card_path
    else
      @customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = @customer.cards.retrieve(@card.card_id)
      @deliver_address = current_user.deliver_address
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @card = CreditCard.find_by(user_id: current_user.id)
    if @card.blank?
      redirect_to new_credit_card_path
    else
      @product = Product.find(params[:id])
      @product.update(buyer_id: current_user.id)
      Payjp::Charge.create(
        :amount => @product.price, 
        :customer => @card.customer_id,
        :currency => 'jpy',
      )
      redirect_to paid_products_path
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :introduction, :size_id,
                                      :condition_id, :postage_payer_id, :prefecture_code,
                                      :prep_date_id, :price, :trading_status,
                                      :closed_deal_date, :category_id,
                                      photos_attributes:[:image, :product_id],
                                      brand_attributes:[:name]
      ).merge(seller_id: current_user.id)
    end

    def find_product
      @product = Product.find(params[:id])
    end

    def adimn_seller
      unless current_user.id == @product.seller_id
        redirect_to product_path
      end
    end
end