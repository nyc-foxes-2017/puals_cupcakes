class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def stars
    ('⭐')* self.rating
  end
end
