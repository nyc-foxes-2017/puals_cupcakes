class User < ApplicationRecord
  include ApplicationHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :favorites
  has_many :backlogs
  has_many :comments
  has_many :reviews

  def activity_feed
    feed = []
    feed << self.favorites
    feed << self.backlogs
    feed << self.comments
    feed << self.reviews
    feed.flatten
  end

  def top_ten
    self.activity_feed.sort_by{|thing| thing.created_at}.reverse[0..9]
  end

  def has_done(event)
    movie = get_movie_by_id(event.movie_id)

    case event
      when Favorite
        return "#{event.user.user_name}  added the movie #{movie[:Title]} to their favorites"
      when Review
        return "#{event.user.user_name} has reviewed the movie #{movie[:Title]} "
      when Comment
        return "#{event.user.user_name} has commented on the movie #{movie[:Title]} "
      when Backlog
        return "#{event.user.user_name} has added the movie #{movie[:Title]} to their watchlist"
    end
  end
end
