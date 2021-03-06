class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :signed_in?
 
  protected
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])    
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
    #we store the user id in the session. if the user is nil then that gets stored, else the user id.
    session[:user_id] = user.nil? ? user : user.id  
  end
end
