class Admin::EventPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @event_posts = EventPost.all
    @event = Event.find(params[:event_id])
  end

  private
end
