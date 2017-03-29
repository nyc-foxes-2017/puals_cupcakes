class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true, :inclusion => { :in => 1..10 }
  validates :user_id, uniqueness: {scope: :movie}

  def stars
    ('⭐')* self.rating
  end
end
