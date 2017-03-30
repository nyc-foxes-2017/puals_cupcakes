module BacklogsHelper

  def find_backlogs_by_user
    if user_signed_in?
      current_user.backlogs
    end
  end
def has_already_backlogged?
    if !user_signed_in?
      return true
    else
      find_backlogs_by_user.any?{|b| b.movie_id == params[:id]}
    end
  end
end
