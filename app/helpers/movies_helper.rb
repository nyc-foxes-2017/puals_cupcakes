module MoviesHelper
  require 'open-uri'
  def average_review_score
    (@movie.reviews.reduce(0){|score, r| score + r.rating } / @movie.reviews.length.to_f).round(1)
  end

  def find_recent_movies

    recent_reviews = Review.all.order("created_at DESC").limit(3)
    @movies_list = recent_reviews.map{ |review| get_movie_by_id( review[:movie_id]) }

  end

  def find_opening_movies
    page = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    imdbid1 = page.xpath('//*[@id="main"]/div/div[2]/div[1]/table/tbody/tr[1]/td[2]/h4/a').to_s[16..24]
    imdbid2 = page.xpath('//*[@id="main"]/div/div[2]/div[2]/table/tbody/tr[1]/td[2]/h4/a').to_s[16..24]
    imdbid3 = page.xpath('//*[@id="main"]/div/div[2]/div[3]/table/tbody/tr[1]/td[2]/h4/a').to_s[16..24]
    @movies2 = [get_movie_by_id(imdbid1), get_movie_by_id(imdbid2), get_movie_by_id(imdbid3)]
    @date = page.xpath('//*[@id="main"]/div/div[2]/h4[1]/a').text
  end

  def find_best_movies
    page = Nokogiri::HTML(open("http://www.imdb.com/chart/top"))
    imdbid1 = page.xpath('//*[@id="main"]/div/span/div/div/div[3]/table/tbody/tr[1]/td[2]/a').to_s[16..24]
    imdbid2 = page.xpath('//*[@id="main"]/div/span/div/div/div[3]/table/tbody/tr[2]/td[2]/a').to_s[16..24]
    imdbid3 = page.xpath('//*[@id="main"]/div/span/div/div/div[3]/table/tbody/tr[3]/td[2]/a').to_s[16..24]
    @movies3 = [get_movie_by_id(imdbid1), get_movie_by_id(imdbid2), get_movie_by_id(imdbid3)]
  end
end
