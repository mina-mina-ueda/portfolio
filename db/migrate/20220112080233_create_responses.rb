class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :post_id
      t.integer :admin_id
      t.text :response
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
