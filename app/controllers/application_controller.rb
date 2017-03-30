 class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def api_key
    "443f5b1e"
  end

  def get_movie_by_id(id)
    request = HTTParty.get("http://www.omdbapi.com/?i=#{id}", format: :plain)
    JSON.parse request, symbolize_names: true
  end

  def search_omdb(query)
    request = HTTParty.get("http://www.omdbapi.com/?s=#{query.split(' ').join("+")}", format: :plain)
    jsons = JSON.parse request, symbolize_names: true
    jsons[:Search]
  end
end
