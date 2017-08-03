class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def show
    tag = Tag.find(params[:tag_id])
    @articles = tag.articles
  end  
end