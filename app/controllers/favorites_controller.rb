class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end
  def new
    @favorite = Favorite.new
  end

  def create
    # params[:movie_id] = params[:id]
    @favorite = Favorite.new(movie_id: params[:movie_id], user_id: current_user.id)
    if @favorite.save
      redirect_to :back
    else
      render :new, status: 422
    end
  end

  def destroy
    @favorite = Favorite.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @favorite.destroy
    redirect_to :back
  end

end
