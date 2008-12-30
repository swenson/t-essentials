# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ExceptionNotifiable
  consider_local "10.0.1.193"
  
  helper :all # include all helpers, all the time
  
  session :session_key => '_directory_session_id'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '307b8a34c931d02b46ef87ce7449305c'
  
  def method_missing(methodname, *args)
    @methodname = methodname
    @args = args
    render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
  end

  def r404
    render :file => "#{RAILS_ROOT}/public/404.html", :layout => false, :status => 404
  end


private

  def twodec(num)
    sprintf("%.2f", num)
  end
  
  def money(num)
    if num
      "$" + twodec(num)
    else
      "$0.00"
    end
  end

  def frommoney(s)
    s.strip.gsub('$', '')
  end
  
  def authorize
    unless User.find_by_id(session[:user_id])
        flash[:notice] = "Please log in"
        redirect_to(:controller => "login", :action => "login")
    else
      @user = User.find(session[:user_id])
      @login_user = @user
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
       @login_user = @user
    end
  end
end
