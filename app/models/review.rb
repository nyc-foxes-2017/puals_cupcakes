class Review < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, :inclusion => { :in => 1..10 }
  validates :user_id, presence: true

  def stars
    ('⭐')* self.rating
  end

  def self.for_movie(id)
    Review.where("movie_id = ?", id)
  end

end
