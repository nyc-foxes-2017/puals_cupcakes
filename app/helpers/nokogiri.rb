require 'open-uri'
require 'nokogiri'
require 'byebug'
page = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
imdbid1 = page.xpath('//*[@id="main"]/div/div[2]/div[1]/table/tbody/tr[1]/td[2]/h4/a').to_s[16..24]
imdbid2 = page.xpath('//*[@id="main"]/div/div[2]/div[2]/table/tbody/tr[1]/td[2]/h4/a').to_s[16..24]
imdb3 = page.xpath('//*[@id="main"]/div/div[2]/div[3]/table/tbody/tr[1]/td[2]/h4/a').to_s[16..24]
puts link1


