class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :categoey, :customer_id)
  end

end
