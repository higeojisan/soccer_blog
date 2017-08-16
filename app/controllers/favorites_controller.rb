class FavoritesController < ApplicationController
  def index
  end

  def create
    if !session[:user_id].blank?
      user_id = session[:user_id]
      article_id = params[:article_id]
      Favorite.find_or_create_by(user_id: user_id, article_id: article_id)
      render :nothing => true
    end
    
  end

  def destroy
    if !session[:user_id].blank?
      favorite = Favorite.find_by(user_id: session[:user_id], article_id: params[:article_id]);
      favorite.destroy
      render :nothing => true
    end  
  end
end
