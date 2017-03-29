module CommentsHelper

  def find_comments_by_user
    current_user.comments
  end

  def has_already_commented?
    if !user_signed_in?
      return false
    end
    find_comments_by_user.any?{|r| r.movie_id == params[:movie_id]}
  end
end
