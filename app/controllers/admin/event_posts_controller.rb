class Admin::EventPostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    # @event_posts = EventPost.page(params[:page])
    # id ではなくevent_idで取得
    @event_posts = EventPost.where(event_id: params[:event_id])
  end

end
