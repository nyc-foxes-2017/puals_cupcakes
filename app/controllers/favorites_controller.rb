class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end
  def new
    @favorite = Favorite.new
  end

  def create
    # params[:movie_id] = params[:id]
    puts request.xhr?
    @movie = get_movie_by_id(params[:movie_id])
    @favorite = Favorite.new(movie_id: params[:movie_id], user_id: current_user.id)
    # if request.xhr?
    #   if @favorite.save
    #     @partial=false
    #     render partial: "favorites-part", layout: false, locals: {favorite: @favorite}
    #   else
    #     render plain: "Not OK"
    #   end
    # else
      if @favorite.save
        redirect_to :back
      else
        render :new, status: 422
      #end
    end
  end

  def destroy
    @favorite = Favorite.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @movie = get_movie_by_id(params[:movie_id])
    @partial = true
    @favorite.destroy
    puts request.xhr?
    # if request.xhr?
    #   render partial: "unfavorites-part", layout: false
    # else
      redirect_to :back
  #  end
  end

end
