class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :link_url
      t.string :image_url
      t.string :title
      t.string :content

      t.timestamps null: false
    end
  end
end
