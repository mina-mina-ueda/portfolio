class AddEventIdToEventPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :event_posts, :event_id, :integer
  end
end
