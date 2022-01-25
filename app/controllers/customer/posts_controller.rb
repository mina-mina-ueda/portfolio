class Customer::PostsController < ApplicationController
  before_action :authenticate_customer!,except: [:index]

  def index
    @responses = Response.page(params[:page]).reverse_order
    @events = Event.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    #@response = @post.response
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save!
      redirect_to thanks_posts_path
    else
      render :new
    end
  end

  def thanks
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category, :customer_id)
  end

end
