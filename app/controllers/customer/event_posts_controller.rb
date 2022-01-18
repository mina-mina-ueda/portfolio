class Customer::EventPostsController < ApplicationController
  before_action :move_to_signed_in

  def new
    @event = Event.find(params[:event_id])
    @event_post = EventPost.new
  end

  def create
    @event_post = EventPost.new(event_post_params)
    @event_post.customer_id = current_customer.id
    @event_post.save!
    redirect_to thanks_posts_path
  end

  private
  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end

  def event_post_params
    params.require(:event_post).permit(:body, :customer_id)
  end

end
