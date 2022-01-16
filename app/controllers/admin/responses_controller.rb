class Admin::ResponsesController < ApplicationController
  def index
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(post_params)
    post_id = params[:post_id]
    @response.post_id = post_id
    @response.save!
    redirect_to posts_path
  end

  private
  def response_params
    params.require(:response).permit(:response)
  end

  def post_params
    params.require(:post).permit(:title, :body, :categoey, :customer_id)
  end
end
