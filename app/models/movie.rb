class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true
  validates :age_rating, presence: true
  validates :duration, presence: true, numericality: {greater_than: 0}

  #validates :title_is_capitalized

  has_many :favorites
  has_many :backlogs

  has_many :comments
  has_many :reviews

  def reviews

  end

end
