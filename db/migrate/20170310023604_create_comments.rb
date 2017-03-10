class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.datetime :post_date
      t.integer :upvotes
      t.integer :account_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
