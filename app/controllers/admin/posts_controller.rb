class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

end
