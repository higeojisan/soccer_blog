class ChangeColumnToArticle < ActiveRecord::Migration
  def change
    change_column :articles, :link_url, :string, null: false, unique: true
    change_column :articles, :image_url, :string, null: false
    change_column :articles, :title, :string, null: false
    change_column :articles, :content, :string, null: false
  end
end
