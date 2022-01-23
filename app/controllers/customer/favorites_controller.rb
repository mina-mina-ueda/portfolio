class Customer::FavoritesController < ApplicationController
  def create
    response = Response.find(params[:response_id])
    favorite = current_customer.favorites.new(response_id: response.id)
    favorite.save
    redirect_to posts_path(response)
  end

  def destroy
    response = Response.find(params[:response_id])
    favorite = current_customer.favorites.find_by(response_id: response.id)
    favorite.destroy
    redirect_to posts_path(response)
  end

end
