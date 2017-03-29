class ReviewsController < ApplicationController
  include ReviewsHelper

  def index
    @reviews = Review.all
    reviews_find_movie
  end

  def new
    reviews_find_movie
    @review = @movie.reviews.new
    @review.user_id = current_user.id
  end

  def create
    reviews_find_movie
    @review = @movie.reviews.new(review_params.tap{ |u| u[:rating] = u[:rating].to_i })
    @review.user_id = current_user.id

    if @review.save
      redirect_to movie_reviews_path
    else
      render :new, status: 422
    end

  end

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
