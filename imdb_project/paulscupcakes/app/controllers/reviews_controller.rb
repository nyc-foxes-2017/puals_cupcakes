class ReviewsController < ApplicationController
  include ReviewsHelper

  def index
    @reviews = Review.all
    reviews_find_movie

  end

end
