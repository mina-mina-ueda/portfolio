class Customer::EventPostsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(post_params)
    @event.customer_id = current_customer.id
    @event.save!
    redirect_to admin_event_posts_path
  end

end
