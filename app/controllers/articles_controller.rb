class ArticlesController < ApplicationController
  def index
    if params[:q].nil?
      @articles = Article.all.order('id DESC')
    else
      if params[:q].empty?
        @articles = Article.all.order('id DESC')
      else
        @articles = Article.where('content like ? or title like ?', "%#{params[:q]}%", "%#{params[:q]}%")
      end
    end
  end
  
  def show
    tag = Tag.find(params[:tag_id])
    @articles = tag.articles
  end  
end