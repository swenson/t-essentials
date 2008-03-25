# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  session :session_key => '_directory_session_id'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '307b8a34c931d02b46ef87ce7449305c'
  
  private
  
  def authorize
    unless User.find_by_id(session[:user_id])
        flash[:notice] = "Please log in"
        redirect_to(:controller => "login", :action => "login")
    else
      @user = User.find(session[:user_id])
    end
  end
  
  def authorize_admin
    unless session[:user_id] and User.find(session[:user_id]).admin
        flash[:notice] = "You are not logged in as an administrator"
        begin
          redirect_to :back
          rescue ::ActionController::RedirectBackError
            redirect_to :controller => "login", :action => "login"
        end
    else
       @user = User.find(session[:user_id])
    end
  end
end
