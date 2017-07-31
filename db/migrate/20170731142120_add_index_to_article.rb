class AddIndexToArticle < ActiveRecord::Migration
  def change
    add_index :articles, :link_url, :unique => true
  end
end
