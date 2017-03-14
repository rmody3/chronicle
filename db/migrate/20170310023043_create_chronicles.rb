class CreateChronicles < ActiveRecord::Migration[5.0]
  def change
    create_table :chronicles do |t|
      t.string :name
      t.string :description
      t.boolean :private, default: false
      t.integer :upvotes, default: 0
      t.integer :downvotes, default: 0
      t.integer :votes, default: 0

      t.integer :admin_id

      t.timestamps
    end
  end
end
