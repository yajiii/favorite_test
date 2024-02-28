class FavoritesController < ApplicationController
  before_action :set_shop
  before_action :set_product

  def index
    if user_signed_in?
      @favorites = Favorite.where(user_id: current_user.id)
      if @favorites.present?
        @shops = Shop.where(id: @favorites.map(&:shop_id))
        @products = Product.where(id: @favorites.map(&:product_id))
      end
    end
  end

  def create
    if params[:shop_id].present?
      @favorite = Favorite.create(user_id: current_user.id, shop_id: params[:shop_id])
    elsif params[:product_id].present?
      @favorite = Favorite.create(user_id: current_user.id, product_id: params[:product_id])
    end
  end

  def destroy
    if params[:shop_id].present?
      @favorite = Favorite.find_by(user_id: current_user.id, shop_id: params[:shop_id])
      @favorite.destroy
    elsif params[:product_id].present?
      @favorite = Favorite.find_by(user_id: current_user.id, product_id: params[:product_id])
      @favorite.destroy
    end
  end

  private
  def set_shop
    return nil if params[:shop_id].blank?
    @shop = Shop.find(params[:shop_id])
  end
  def set_product
    return if params[:product_id].blank?
    @product = Product.find(params[:product_id])
  end
end
