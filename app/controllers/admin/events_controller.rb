class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_admin.id
    @event.save!
    redirect_to admin_event_posts_path
  end

  def edit
  end

  def update
  end

  private
  def event_params
    params.require(:event).permit(:title, :body, :period, :admin_id)
  end
end
