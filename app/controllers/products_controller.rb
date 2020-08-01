class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @product = Product.new
    @parents = Category.all.order("id ASC").limit(13)
    @categories = @product.categories.build
    @photos =  @product.photos.build
    @brand = @product.build_brand
  end

  def create
    @product = Product.new(product_params)
    binding.pry
    unless @product.valid?
      flash.now[:alert] = @product.errors.full_messages
      render :new and return
    end
    @product.save
    redirect_to user_path(current_user)
  end

  def get_category_children
    @children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
    def product_params
      params.require(:product).permit(:name, :introduction, :size_id,
                                      :condition_id, :postage_payer_id, :prefecture_code,
                                      :prep_date_id, :price, :trading_status,
                                      :closed_deal_date,
                                      photos_attributes:[:image, :product_id],
                                      brand_attributes:[:name],
                                      categories_attributes:[:name]
      ).merge(seller_id: current_user.id)
    end
end