class Comment < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true


  def self.for_movie(id)
    Comment.where("movie_id = ?", id)
  end
end
