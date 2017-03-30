class BacklogsController < ApplicationController

  def create
    @backlog = Backlog.new(movie_id: params[:movie_id], user_id: current_user.id)
    @backlog.save
    redirect_to "movies#show"
  end

  def destroy
    @backlog = Backlog.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @backlog.destroy
    redirect_to "movies#show"
  end

end
