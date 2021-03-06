class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :title, index: true
      t.text :text, index: true

      t.timestamps
    end
  end
end
