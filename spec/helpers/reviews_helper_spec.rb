require 'rails_helper'



RSpec.describe ReviewsHelper, type: :helper do
  let!(:movie) { Movie.create(
      { title: 'Die Hard with a Vengeance',
      description: 'John McClane and a Harlem store owner are targeted by German terrorist Simon Gruber in New York City, where he plans to rob the Federal Reserve Building.',
      year: 1995,
      age_rating: "R",
      duration: 128 }) }

  it "returns a movie if movie exists" do
      params[:movie_id] = movie.id
      expect(helper.reviews_find_movie.id).to eq movie.id
  end
end
