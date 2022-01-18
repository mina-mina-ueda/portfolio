class Admin::EventPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @event = Event.all
  end

  private
end
