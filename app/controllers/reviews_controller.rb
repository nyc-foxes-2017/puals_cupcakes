class ReviewsController < ApplicationController
  include ReviewsHelper

  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @movie = get_movie_by_id(params[:movie_id])

    @reviews = Review.for_movie(params[:movie_id])
  end

  def new
    @movie = get_movie_by_id(params[:movie_id])
    @review = Review.new

  end

  def create
    @review = Review.new(review_params.tap{ |u| u[:rating] = u[:rating].to_i })
    @review.movie_id = params[:movie_id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to "/movies/#{params[:movie_id]}"
    else
      render :new, status: 422
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice]="review was successfully destroyed"
    redirect_to movie_reviews_path
  end
  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
