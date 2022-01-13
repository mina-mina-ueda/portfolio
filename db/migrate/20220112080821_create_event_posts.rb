class CreateEventPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :event_posts do |t|
      t.integer :customer_id
      t.string :title
      t.text :body
      t.date :period
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
