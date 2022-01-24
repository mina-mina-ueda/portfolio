class Customer::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    favorite = current_customer.favorites.new(post_id: params[:post_id])
    favorite.save
    redirect_to posts_path
  end

  def destroy
    favorite = current_customer.favorites.find_by(post_id: params[:post_id])
    favorite.destroy
    redirect_to posts_path
  end

end
