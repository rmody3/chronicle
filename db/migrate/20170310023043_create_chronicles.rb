class CreateChronicles < ActiveRecord::Migration[5.0]
  def change
    create_table :chronicles do |t|
      t.string :name
      t.string :description
      t.boolean :public, default: true
      t.integer :upvotes
      t.integer :admin_id

      t.timestamps
    end
  end
end
