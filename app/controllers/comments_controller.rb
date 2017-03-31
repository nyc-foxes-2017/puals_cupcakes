class CommentsController < ApplicationController
  include CommentsHelper
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @movie = get_movie_by_id(params[:movie_id])

    @comments = Comment.for_movie(params[:movie_id])
  end

  def new
    @movie = get_movie_by_id(params[:movie_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.movie_id = params[:movie_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to "/movies/#{params[:movie_id]}"
    else
      render :new, status: 422
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice]="comment was successfully destroyed"
    redirect_to movie_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
