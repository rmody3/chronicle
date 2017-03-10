class CreateArticleChronicles < ActiveRecord::Migration[5.0]
  def change
    create_table :article_chronicles do |t|
      t.integer :article_id
      t.integer :chronicle_id

      t.timestamps
    end
  end
end
