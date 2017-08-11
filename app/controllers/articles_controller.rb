class ArticlesController < ApplicationController
  def index
    if params[:q].nil?
      @articles = Article.order('id DESC').includes(:tags).page params[:page]
    else
      if params[:q].empty?
        @articles = Article.order('id DESC').includes(:tags).page params[:page]
      else
        @articles = Article.where('content like ? or title like ?', "%#{params[:q]}%", "%#{params[:q]}%").includes(:tags).page params[:page]
      end
    end
  end
  
  def show
    tag = Tag.find_by(id: params[:tag_id])
    if tag.nil?
      @articles = []
    else
      @articles = tag.articles.includes(:tags).page params[:page]
    end
  end
end