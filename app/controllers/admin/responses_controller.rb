class Admin::ResponsesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @response = Response.page(params[:page]).reverse_order
    @events = Event.all
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
    if @response.save!
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
    @response = Response.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def update
    @response = Response.find(params[:id])
    if @response.update(response_params)
      redirect_to admin_responses_index_path, notice: "返答内容を変更しました！"
    else
      render :edit
    end
  end

  private
  def response_params
    params.require(:response).permit(:admin_id, :response)
  end

end
