module ApplicationHelper
  def logged_in?
  	!!session[:user_id]
  end

  def current_user
  	User.find_by(id: params[:user_id]) if logged_in?
  end
end
