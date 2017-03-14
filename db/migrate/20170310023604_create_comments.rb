class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :account_id
      t.integer :chronicle_id
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
