class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @events = Event.page(params[:page]).reverse_order
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_admin.id
    @event.save
    redirect_to admin_events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_events_path
      flash[:event] = "イベント内容を変更しました！"
    else
      render "edit"
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :body, :period, :admin_id)
  end
end
