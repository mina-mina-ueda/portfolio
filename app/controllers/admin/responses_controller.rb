class Admin::ResponsesController < ApplicationController
  def index
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(post_params)
    @response.save!
    redirect_to posts_path
  end

  def response_params
    params.require(:response).permit(:response)
  end
end
