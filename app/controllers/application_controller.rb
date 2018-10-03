class ApplicationController < ActionController::Base
  #protect_from_forgery  with: :exception

  # Make the current_user method available to views also, not just controllers:
  helper_method :current_user

  # Define the current_user method:
  def current_user
    # Look up the current user based on user_rfc in the session cookie:
    @current_user ||= User.find_by_rfc(session[:user_rfc]) if session[:user_rfc]
  end

  # authroize method redirects user to login page if not logged in:
  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

end
