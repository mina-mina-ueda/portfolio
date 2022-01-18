class Admin::EventPostsController < ApplicationController
  def index
    @event = Event.find(params[:id])
  end

  private
end
