class BacklogsController < ApplicationController

  def index
    @backlogs = Backlog.all
  end
  def new
    @backlog = Backlog.new
  end

  def create
    @backlog = Backlog.new(movie_id: params[:movie_id], user_id: current_user.id)
    if @backlog.save
      redirect_to :back
    else
      render :new, status: 422
    end
  end

  def destroy
    @backlog = Backlog.find_by(movie_id: params[:movie_id], user_id: current_user.id)
    @backlog.destroy
    redirect_to :back
  end

end
