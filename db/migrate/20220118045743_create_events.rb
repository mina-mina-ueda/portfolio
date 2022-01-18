class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :admin_id
      t.string :title
      t.text :body
      t.date :period

      t.timestamps
    end
  end
end
