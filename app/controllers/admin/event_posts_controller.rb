class Admin::EventPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @event_posts = EventPost.page(params[:page]).reverse_order
    @event = Event.find(params[:event_id])
  end

end
