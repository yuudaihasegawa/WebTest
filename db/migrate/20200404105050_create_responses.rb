class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.text :message, index: true

      t.timestamps
    end
  end
end
