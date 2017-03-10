class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.date :date
      t.string :url
      t.string :pic_url

      t.timestamps
    end
  end
end
