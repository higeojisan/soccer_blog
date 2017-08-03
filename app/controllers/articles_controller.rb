class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('id DESC')
  end
  
  def show
    tag = Tag.find(params[:tag_id])
    @articles = tag.articles
  end  
end