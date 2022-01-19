class Admin::ResponsesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @response = Response.page(params[:page]).reverse_order
  end

  def new
    @response = Response.new
    @post = Post.find(params[:post_id])
  end

  def create
    @response = Response.new(response_params)
    post_id = params[:post_id]
    @response.post_id = post_id
    @response.admin_id = current_admin.id
    @response.save!
    redirect_to admin_posts_path
  end

  private
  def response_params
    params.require(:response).permit(:post_id, :admin_id, :response)
  end

end
